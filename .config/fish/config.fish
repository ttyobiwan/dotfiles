if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    set colors red green yellow blue magenta cyan
    set_color $colors[(random 1 (count $colors))]
    echo '店に入って、床を買ったんだ、だって私はそういう人間だから'
    set_color normal
end

# opencode
fish_add_path /Users/Piotr/.opencode/bin
mise activate fish | source

# Amp CLI
export PATH="/Users/Piotr/.amp/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
