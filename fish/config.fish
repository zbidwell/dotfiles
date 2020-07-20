thefuck --alias | source

set -x PATH $HOME/.cargo/bin:$PATH

function l
    exa -la $argv
end

function ll
    l $argv
end

function tree
    exa -l --tree $argv
end
