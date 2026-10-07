// Observation only, using the same server state as original M3 diagnostics.
#include "cbase.h"
#include "cs_gamerules.h"
#include <mach/mach.h>
#include <mach-o/dyld.h>
#include <mach-o/loader.h>
#include <unistd.h>
CON_COMMAND_F(i3_tick, "Read iPad server tick and actual loaded platforms", FCVAR_RELEASE){
 task_vm_info_data_t vm={};mach_msg_type_number_t count=TASK_VM_INFO_COUNT;
 kern_return_t result=task_info(mach_task_self(),TASK_VM_INFO,(task_info_t)&vm,&count);
 if(gpGlobals)Msg("I3_TICK pid=%d tick=%d interval=%.9f realtime=%.6f footprint=%llu memory_result=%d\n",getpid(),gpGlobals->tickcount,gpGlobals->interval_per_tick,gpGlobals->realtime,vm.phys_footprint,result);
 const char *executable=_dyld_get_image_name(0);const char *end=strrchr(executable,'/');size_t length=end?(size_t)(end-executable):0;
 for(uint32_t i=0;i<_dyld_image_count();++i){const char *name=_dyld_get_image_name(i);if(!length || strncmp(name,executable,length)!=0)continue;
  auto hdr=(const mach_header_64*)_dyld_get_image_header(i);unsigned platform=0;const load_command *cmd=(const load_command*)(hdr+1);
  for(unsigned n=0;n<hdr->ncmds;++n){if(cmd->cmd==LC_BUILD_VERSION)platform=((const build_version_command*)cmd)->platform;cmd=(const load_command*)((const char*)cmd+cmd->cmdsize);}
  Msg("I3_MODULE arch=%d platform=%u path=%s\n",hdr->cputype,platform,name);
 }
}
