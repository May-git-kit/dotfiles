if status is-interactive
    # --- Disable Greeting ---
    set -g fish_greeting

    # --- Environment Variables ---
    set -gx EDITOR micro
    set -gx VISUAL micro
    set -gx BROWSER zen-browser
    set -gx TERMINAL foot
    set -Ua fish_user_paths $HOME/.cargo/bin

    # --- Modern Replacements (from your script) ---
    # eza -> ls
    alias ls='eza --icons --group-directories-first'
    alias ll='eza -lh --icons --group-directories-first'
    alias la='eza -a --icons --group-directories-first'
    alias tree='eza --tree --icons'

    # bat -> cat
    alias cat='bat --theme="base16"'

    # cd -> zoxide
    zoxide init fish | source
    #alias cd='z'

    #fd
    alias find fd
    # ripgrep (Better grep)
    alias grep rg

    # procs (Better ps)
    alias ps procs

    # dust (Better du)
    alias du dust

    # atuin (Magic shell history)
    atuin init fish | source

    # tealdeer (Fast tldr)
    alias help tldr

    # fastfetch (Modern neofetch)
    alias fetch fastfetch
    alias check 'fastfetch; and btop' # Quick system health check

    # btop (Resource monitor)
    alias htop btop

    # Editors
    alias vi nvim
    alias vim nvim
    alias edit micro

    # zellij (Terminal workspace)
    alias zj zellij

    # --- System Shortcuts ---
    alias update='paru -Syu'
    alias cleanup='paru -Rns (pacman -Qtdq)'
    alias niri-conf='micro ~/.config/niri/config.kdl'
    alias fish-conf='micro ~/.config/fish/config.fish'

    #abbreviations
    # eza
    #abbr -a l   eza --icons
    #abbr -a ls  eza --icons --group-directories-first
    #abbr -a ll  eza -lh --icons --group-directories-first
    #abbr -a la  eza -a --icons --group-directories-first
   # abbr -a lt  eza --tree --icons

    #yazi
    abbr -a y yazi

    # zoxide & fd
    #abbr -a cd  z
    abbr -a f   fd

    # ripgrep
    abbr -a g   rg
    abbr -a grep rg

    # sd (Search & Displace)
    abbr -a sed sd

    # Monitoring
    abbr -a top  btop
    abbr -a ps   procs
    abbr -a du   dust -d 1  # Shows depth of 1 by default for speed

    # Info
    abbr -a ff   fastfetch
    abbr -a tl   tldr

    # Multiplexer
    abbr -a zl   zellij
    abbr -a zla  zellij attach

    # Editors
    abbr -a v    nvim
    abbr -a vi   nvim
    abbr -a vim  nvim
    abbr -a m    micro

    #Custom
    abbr -a cl clear

    # --- Utilities ---
    # Fastfetch on startup (optional)
    #fastfetch

    # --- Starship Prompt ---
    # Ensure starship is installed: paru -S starship
    #starship init fish | source

    # --- Set Catppuccin Mocha Colors ---
    set -U fish_color_normal cdd6f4
    set -U fish_color_command 89b4fa
    set -U fish_color_param f2cdcd
    set -U fish_color_keyword f38ba8
    set -U fish_color_quote a6e3a1
    set -U fish_color_redirection f5c2e7
    set -U fish_color_end fab387
    set -U fish_color_comment 7f849c
    set -U fish_color_error f38ba8
    set -U fish_color_gray 6c7086
    set -U fish_color_selection --background=313244
    set -U fish_color_search_match --background=313244
    set -U fish_color_operator 94e2d5
    set -U fish_color_escape f5c2e7
    set -U fish_color_autosuggestion 6c7086

    # Directory Colors
    set -U tide_pwd_color_anchors 89b4fa
    set -U tide_pwd_color_dirs cdd6f4
    set -U tide_pwd_color_truncated_dirs a6adc8

    # Git Status Colors
    set -U tide_git_color_branch cba6f7
    set -U tide_git_color_conflicted f38ba8
    set -U tide_git_color_dirty f9e2af
    set -U tide_git_color_operation f38ba8
    set -U tide_git_color_staged a6e3a1
    set -U tide_git_color_stash 74c7ec
    set -U tide_git_color_untracked eba0ac
    set -U tide_git_color_upstream 89dceb

    # Timing & Status Colors
    set -U tide_cmd_duration_color fab387
    set -U tide_status_color f38ba8
    set -U tide_status_color_failure f38ba8

    # Context (User@Host) & OS Logo
    set -U tide_context_color_default 89b4fa
    set -U tide_context_color_root f38ba8
    set -U tide_os_color 89b4fa

    # Atuin Catppuccin Mocha Colors
    set -gx ATUIN_LOG_LEVEL error
    set -gx ATUIN_NO_UPDATE_CHECK true

    # Customizing the UI colors via Env Vars
    # These map to Catppuccin Mocha hex codes
    set -gx ATUIN_COLOR_INDEX "89b4fa"      # Blue
    set -gx ATUIN_COLOR_COMMAND "cdd6f4"    # Text
    set -gx ATUIN_COLOR_DURATION "fab387"   # Peach
    set -gx ATUIN_COLOR_TIMESTAMP "6c7086"  # Overlay0
end

#if status is-login
#    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#        exec niri --session
#    end
#end
