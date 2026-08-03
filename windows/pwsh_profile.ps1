# Vi mode cursor
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -ViModeIndicator Script
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler {
    if ($args[0] -eq 'Command') {
        Write-Host -NoNewline "`e[2 q"
    } else {
        Write-Host -NoNewline "`e[6 q"
    }
}
Write-Host -NoNewline "`e[6 q"

# Keybinds
Set-PSReadLineKeyHandler -ViMode Insert -Key Ctrl+y -Function AcceptSuggestion
Set-PSReadLineKeyHandler -ViMode Insert -Key Ctrl+p -Function HistorySearchBackward
Set-PSReadLineKeyHandler -ViMode Insert -Key Ctrl+n -Function HistorySearchForward

# Lazygit
function lg {
  lazygit
}

# Zoxide
zoxide init powershell | Out-String | Invoke-Expression

# Yazi
function y {
	$tmp = (New-TemporaryFile).FullName
	yazi.exe @args --cwd-file="$tmp"
  if (Test-Path $tmp) {
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if ($cwd -and $cwd -ne $PWD.Path -and (Test-Path -LiteralPath $cwd -PathType Container)) {
      Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
  }
}

# Eza
function la {
  eza --long --icons=always --git --all
}

Remove-Item Alias:ls -Force
function ls {
  eza --color=always --long --icons=always --git --no-filesize --all --no-time --no-user --no-permissions
}

function lt {
  eza --tree --level=2 --long --icons --git
}

# Fzf
$env:FZF_DEFAULT_COMMAND = "fd --hidden --strip-cwd-prefix --exclude .git"
$env:FZF_CTRL_T_COMMAND  = $env:FZF_DEFAULT_COMMAND
$env:FZF_ALT_C_COMMAND   = "fd --type=d --hidden --strip-cwd-prefix --exclude .git"
$env:FZF_CTRL_T_OPTS     = "--preview 'bat -n --color=always --line-range :500 {}'"
$env:FZF_ALT_C_OPTS      = "--preview 'eza --tree --color=always {} | head -200'"

$ENV:FZF_DEFAULT_OPTS=@"
--color=bg+:#313244,bg:-1,spinner:#F5E0DC,hl:#F38BA8
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8
--color=selected-bg:#45475A
--color=border:#6C7086,label:#CDD6F4
"@

Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

Invoke-Expression (&starship init powershell)
