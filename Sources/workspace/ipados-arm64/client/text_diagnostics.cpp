// Read-only evidence from the real Source converters and client resources.
#include "cbase.h"
#include "c_cs_playerresource.h"
#include "tier1/strtools.h"
#include <locale.h>

CON_COMMAND_F(i4_text_state, "Check real UTF-8 conversions and report actual player names", FCVAR_RELEASE)
{
    wchar_t wide[32]={};char back[128]={};
    const char *sample="中文 / arm64 / 😀";
    int chars=_V_UTF8ToUnicode(sample,wide,sizeof(wide));
    _V_UnicodeToUTF8(wide,back,sizeof(back));
    wchar_t bounded[3]={};char shortUTF8[4]={};
    _V_UTF8ToUnicode("中文测试",bounded,sizeof(bounded));
    _V_UnicodeToUTF8(L"中文",shortUTF8,sizeof(shortUTF8));
    bool ok=!V_strcmp(sample,back) && wide[0]==0x4e2d && wide[1]==0x6587 &&
            bounded[0]==0x4e2d && bounded[1]==0x6587 && !bounded[2] &&
            !V_strcmp(shortUTF8,"中");
    Msg("I4_TEXT utf8_round_trip=%d bounded_conversion=%d chars=%d wchar_bytes=%zu libc_locale=%s text=%s\n",
        !V_strcmp(sample,back),ok,chars,sizeof(wchar_t),setlocale(LC_CTYPE,nullptr),back);
    auto resource=GetCSResources();
    if(!resource)return;
    for(int i=1;i<=gpGlobals->maxClients;++i)if(resource->IsConnected(i)){
        wchar_t decorated[4*MAX_DECORATED_PLAYER_NAME_LENGTH]={};char name[sizeof(decorated)]={};
        resource->GetDecoratedPlayerName(i,decorated,sizeof(decorated),k_EDecoratedPlayerNameFlag_Simple);
        _V_UnicodeToUTF8(decorated,name,sizeof(name));
        Msg("I4_PLAYER_NAME index=%d bot=%d raw=%s decorated=%s\n",i,resource->IsFakePlayer(i),resource->GetPlayerName(i),name);
    }
}
