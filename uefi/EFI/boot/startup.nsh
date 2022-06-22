@echo -off
mode 128 40
set -v AppleEnv 7C436110-AB2A-4BBB-A880-FE41995C9F82
if x%uefishellversion% == x then
    # Startup commands for EFI 1.0 shells
    alias -v cv "ver -s"
    alias -v ush "shellx64.efi -nomap -noversion -delay 0"
    if "x%StartupDelay%" == x then
        set StartupDelay 0
    endif
    cls
else
    # Startup commands for UEFI 2.2 shells
    set -v ShellAlias 0053D9D6-2659-4599-A26B-EF4536E631A9
    set -v SEnv 158DEF5A-F656-419C-B027-7A3192C079D2
    alias -v csrutil "setvar csr-active-config -nv -rt -bs -guid %AppleEnv%"
    alias -v cv ver
    if "x%ShellOpt%" == x then
        setvar ShellOpt -nv -bs -guid %SEnv% =L"-nomap -noversion -delay 0" =0000
    endif
endif
cv
