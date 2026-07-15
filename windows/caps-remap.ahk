#Requires AutoHotkey v2.0

$+`::SendText "~"


#HotIf WinActive("ahk_exe Code.exe") || WinActive("ahk_exe devenv.exe") || WinActive("ahk_exe wezterm-gui.exe")

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



wallpaperEnginePath := "D:\Games\Steam\steamapps\common\wallpaper_engine\wallpaper64.exe"

; Ctrl + Alt + Space = pause/play Wallpaper Engine
wallpaperPaused := false

^!Space::
{
    global wallpaperPaused, wallpaperEnginePath

    if wallpaperPaused {
        Run '"' wallpaperEnginePath '" -control play'
        wallpaperPaused := false
    } else {
        Run '"' wallpaperEnginePath '" -control pause'
        wallpaperPaused := true
    }
}

; Ctrl + Alt + M = mute/unmute Wallpaper Engine
wallpaperMuted := false

^!m::
{
    global wallpaperMuted, wallpaperEnginePath

    if wallpaperMuted {
        Run '"' wallpaperEnginePath '" -control unmute'
        wallpaperMuted := false
    } else {
        Run '"' wallpaperEnginePath '" -control mute'
        wallpaperMuted := true
    }
}
