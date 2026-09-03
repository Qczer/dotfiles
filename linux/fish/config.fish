# Vi mode
fish_vi_key_bindings

function fish_mode_prompt
    switch $fish_bind_mode
        case default
            printf '\e[2 q'
        case insert
            printf '\e[6 q'
        case replace_one
            printf '\e[4 q'
        case '*'
            printf '\e[6 q'
    end
end

printf '\e[6 q'


# Keybinds
alias vim nvim

bind -M insert \cy accept-autosuggestion
bind -M insert \cp history-search-backward
bind -M insert \cn history-search-forward


# Lazygit
alias lg lazygit


# Zoxide
zoxide init fish | source


# Yazi
function y
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")

    yazi $argv --cwd-file="$tmp"

    if read -z cwd <"$tmp"; and test -n "$cwd"; and test "$cwd" != "$PWD"; and test -d "$cwd"
        cd -- "$cwd"
    end

    rm -f -- "$tmp"
end


# Eza
function la
    eza --long --icons=always --git --all
end

function ls
    eza --color=always --long --icons=always --git \
        --no-filesize --all --no-time --no-user --no-permissions
end

function lt
    eza --tree --level=2 --long --icons --git
end


# Fzf
set -gx FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_ALT_C_COMMAND "fd --type=d --hidden --strip-cwd-prefix --exclude .git"
set -gx FZF_CTRL_T_OPTS "--preview 'bat -n --color=always --line-range :500 {}'"
set -gx FZF_ALT_C_OPTS "--preview 'eza --tree --color=always {} | head -200'"

set -g fish_greeting

# Starship
starship init fish | source
if status is-interactive
    and not set -q TMUX
    tmux
end
