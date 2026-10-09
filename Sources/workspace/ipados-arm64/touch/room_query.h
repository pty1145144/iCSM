#pragma once
// A2S_INFO wire fields follow engine/baseserver.cpp, case A2S_INFO.
#include <string>
#include <vector>
#include <cstring>
#include <chrono>
#include <cstdint>
#include <cerrno>
#include <arpa/inet.h>
#include <netdb.h>
#include <sys/socket.h>
#include <poll.h>
#include <unistd.h>

namespace ICSMRooms {
struct Info {
    std::string endpoint, name, map, version;
    int players=0, maximum=0, bots=0, ping=0;
    bool password=false, online=false;
};
inline bool Endpoint(const std::string &input, std::string &host, uint16_t &port) {
    if(input.empty() || input.size()>259)return false;
    const size_t split=input.find(':');
    host=input.substr(0,split);port=27015;
    if(host.empty() || host.size()>253 || host.front()=='.' || host.back()=='.')return false;
    for(unsigned char c:host)if(!((c>='a'&&c<='z')||(c>='A'&&c<='Z')||(c>='0'&&c<='9')||c=='.'||c=='-'))return false;
    if(split!=std::string::npos) {
        std::string number=input.substr(split+1);
        if(number.empty()||number.size()>5)return false;
        unsigned value=0;
        for(unsigned char c:number){if(c<'0'||c>'9')return false;value=value*10+c-'0';}
        if(!value || value>65535)return false;
        port=(uint16_t)value;
    }
    return true;
}
inline bool ParseInfo(const uint8_t *data,size_t size,Info &info) {
    if(size<6 || memcmp(data,"\xff\xff\xff\xff\x49",5))return false;
    size_t at=6;
    auto text=[&](std::string &out) {
        const size_t start=at;
        while(at<size && data[at])++at;
        if(at==size || at-start>1024)return false;
        out.assign((const char*)data+start,at-start);++at;
        for(char &c:out)if((unsigned char)c<32)c=' ';
        return true;
    };
    std::string folder,game;
    if(!text(info.name)||!text(info.map)||!text(folder)||!text(game)||at+9>size)return false;
    unsigned app=data[at]|(data[at+1]<<8);at+=2;
    if(folder!="csgo" || (app!=730 && app!=0))return false;
    info.players=data[at++];info.maximum=data[at++];info.bots=data[at++];
    at+=2;info.password=data[at++]!=0;++at;
    if(!text(info.version))return false;
    info.online=true;return true;
}
inline Info Query(const std::string &endpoint) {
    Info info;info.endpoint=endpoint;
    std::string host;uint16_t port;
    if(!Endpoint(endpoint,host,port))return info;
    addrinfo hints={},*addresses=nullptr;hints.ai_family=AF_INET;hints.ai_socktype=SOCK_DGRAM;
    if(getaddrinfo(host.c_str(),std::to_string(port).c_str(),&hints,&addresses))return info;
    sockaddr_in remote=*(sockaddr_in*)addresses->ai_addr;freeaddrinfo(addresses);
    int fd=socket(AF_INET,SOCK_DGRAM,0);if(fd<0)return info;
    if(connect(fd,(sockaddr*)&remote,sizeof(remote))){close(fd);return info;}
    const char request[]="\xff\xff\xff\xff\x54Source Engine Query";
    std::vector<uint8_t> bytes(request,request+sizeof(request));
    auto began=std::chrono::steady_clock::now();
    for(int attempt=0;attempt<3;++attempt) {
        if(send(fd,bytes.data(),bytes.size(),0)!=(ssize_t)bytes.size())break;
        pollfd pending={fd,POLLIN,0};
        if(poll(&pending,1,600)<=0 || !(pending.revents&POLLIN))continue;
        uint8_t response[4096];ssize_t count=recv(fd,response,sizeof(response),0);
        if(count>=9 && !memcmp(response,"\xff\xff\xff\xff\x41",5)) {
            bytes.assign(request,request+sizeof(request));bytes.insert(bytes.end(),response+5,response+9);continue;
        }
        if(count>0 && ParseInfo(response,(size_t)count,info)) {
            char address[INET_ADDRSTRLEN];inet_ntop(AF_INET,&remote.sin_addr,address,sizeof(address));
            info.endpoint=std::string(address)+":"+std::to_string(port);
            info.ping=(int)std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::steady_clock::now()-began).count();
            break;
        }
    }
    close(fd);return info;
}
}
