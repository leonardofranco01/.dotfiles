function rf
    rg --line-number --no-heading --color=always --smart-case "$argv" | \
    fzf --ansi --delimiter : --preview "bat --color=always {1} --highlight-line {2}" --preview-window 'up,60%,border-bottom,+{2}+3/3' | \
    awk -F: '{print $1 " +" $2}' | \
    xargs -r $EDITOR
end
