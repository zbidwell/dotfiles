thefuck --alias | source

set -x PATH $HOME/.cargo/bin:$PATH

function l
    exa -la --git $argv
end

function ll
    l $argv
end

function tree
    exa -l --tree --git $argv
end
