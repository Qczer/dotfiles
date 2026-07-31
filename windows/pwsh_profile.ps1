# Keybinds
Set-PSReadLineKeyHandler -Key Ctrl+y -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Key Ctrl+p -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key Ctrl+n -Function HistorySearchForward

# Zoxide
zoxide init powershell | Out-String | Invoke-Expression
Remove-Item Alias:cd -Force
function cd {
  param(
    [Parameter(ValueFromRemainingArguments)]
    [string[]]$Path
  )

  z @Path
}

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

$env:FZF_DEFAULT_OPTS    = "--color=fg:#c0caf5,bg:-1,hl:#2ac3de,fg+:#c0caf5,bg+:#283457 --color=hl+:#2ac3de,info:#7aa2f7,prompt:#2ac3de,pointer:#ff007c --color=marker:#ff5da0,spinner:#ff007c,header:#ff9e64,query:#c0caf5 --color=border:#27a1b9,separator:#ff9e64,gutter:#283457"

Import-Module PSFzf
