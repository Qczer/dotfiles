#Requires AutoHotkey v2.0

$+`::SendText "~"


SetTimer CheckVSCode, 500

CheckVSCode() {
    if WinActive("ahk_exe Code.exe") && GetKeyState("CapsLock", "T")
        SetCapsLockState "Off"
}


#HotIf WinActive("ahk_exe Code.exe")

*CapsLock::
{
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