#Requires AutoHotkey v2.0

$+`::SendText "~"


#HotIf WinActive("ahk_exe Code.exe") || WinActive("ahk_exe devenv.exe")

*CapsLock::
{
    SetCapsLockState "Off"
    Send "{Ctrl down}"
}

*CapsLock Up::
{
    Send "{Ctrl up}"

    if (A_PriorKey = "CapsLock")
    {
        Send "{Esc}"
    }
}

#HotIf