if status is-interactive
    # Commands to run in interactive sessions can go here
    # Configure auto-attach/exit to your likings (default is off).
    # set ZELLIJ_AUTO_ATTACH true
    # set ZELLIJ_AUTO_EXIT false
    #
    # if not set -q ZELLIJ
    #     if test "$ZELLIJ_AUTO_ATTACH" = true
    #         zellij attach -c main
    #     else
    #         zellij
    #     end
    #
    #     if test "$ZELLIJ_AUTO_EXIT" = true
    #         kill $fish_pid
    #     end
    # end

    set -g fish_greeting
    # starship init fish | source
    zoxide init fish --cmd cd | source
    fzf --fish | source
    direnv hook fish | source
    set -gx EDITOR nvim
    set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border"
    set -g fzf_preview_dir_cmd eza --all --color=always
    set -g fzf_history_opts --preview="echo '{}'" --preview-window=down:3:wrap
    set -g fzf_preview_file_cmd bat --style=numbers --color=always --line-range :500
    # tmux new-session -A -s 'main'

end

# uv
fish_add_path "/home/leo/.local/share/../bin"
