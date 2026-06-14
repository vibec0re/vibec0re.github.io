# 💜⚡ VIBEC0RE ZSH CONFIG ⚡💜
# ULTRA C0RE ALIASES FOR MAXIMUM PRODUCTIVITY
# MINIMIZE BULLSHIT, MAXIMIZE OUTPUT

# RUST SUPREMACY ALIASES
alias rs='cargo run'
alias rb='cargo build --release'
alias rt='cargo test'
alias rc='cargo clippy'
alias rf='cargo fmt'
alias rn='cargo new'
alias ra='cargo add'
alias rr='cargo remove'
alias rw='cargo watch -x run'
alias mommy='cargo mommy'

# GIT VIBEC0RE PROTOCOL
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git merge'
alias ship='git add . && git commit -m "🚀 SHIP IT" && git push'
alias yeet='git push --force'
alias unfuck='git reset --hard HEAD'

# DIRECTORY NAVIGATION VIBES
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias tree='tree -C'
alias here='pwd'

# HUGO CYBER PROTOCOL
alias hdev='hugo server -D'
alias hbuild='hugo --minify'
alias hnew='hugo new posts/'

# SYSTEM VIBEC0RE
alias cls='clear'
alias c='clear'
alias q='exit'
alias reload='source ~/.zshrc'
alias zshrc='nvim ~/.zshrc'
alias vibes='echo "💜⚡ MAXIMUM VIBES ACHIEVED ⚡💜"'

# FILE OPERATIONS C0RE
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'
alias df='df -h'
alias du='du -h'
alias free='free -h'

# SEARCH AND FIND PROTOCOL
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rg='rg --color=always'
alias fd='fd --color=always'

# NETWORK CYBER COMMANDS
alias ping='ping -c 5'
alias wget='wget -c'
alias curl='curl -L'
alias myip='curl ipinfo.io/ip'

# PROCESS MANAGEMENT VIBES
alias ps='ps aux'
alias top='htop'
alias kill9='kill -9'

# DOCKER SUPREMACY (when forced to use containers)
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias dstop='docker stop $(docker ps -q)'
alias dclean='docker system prune -f'

# DEVELOPMENT PROTOCOL
alias py='python3'
alias pip='pip3'
alias node='echo "💀 NODE.JS DETECTED - MIGRATE TO RUST 💀" && node'
alias npm='echo "💀 NPM DETECTED - USE CARGO 💀" && npm'
alias yarn='echo "💀 YARN DETECTED - USE CARGO 💀" && yarn'

# VIBEC0RE MANIFESTO FUNCTIONS
function vibe() {
    echo "💜⚡ EMBRACE EXPONENTIELS ⚡💜"
    echo "🦀🌈 MINIMIZE THE BULLSHIT 🌈🦀"
    echo "⚡💎 MAXIMIZE THE OUTPUT 💎⚡"
    echo "👑🔥 SHIP DIRTY CODE THAT WORKS 🔥👑"
}

function uwu() {
    echo "${1} uwu 💜"
}

function hiii() {
    echo "hiii💕 ${1:-choom}"
}

function exponentiels() {
    echo "📈💜 ${1} TO THE MOON 💜🚀"
}

function chooom() {
    vibe
    echo "\n🌈✨ LET'S FUCKING GOOOOOO ✨🌈"
}

# RUST PROJECT QUICK START
function rustify() {
    if [[ -z "$1" ]]; then
        echo "💜⚡ Usage: rustify project-name ⚡💜"
        return 1
    fi
    
    cargo new "$1"
    cd "$1"
    echo "🦀💜 RUST PROJECT INITIALIZED 💜🦀"
    echo "⚡🔥 READY TO BECOME AS GODS 🔥⚡"
}

# VIBEC0RE GIT WORKFLOW
function vibecommit() {
    if [[ -z "$1" ]]; then
        echo "💜⚡ Usage: vibecommit 'commit message' ⚡💜"
        return 1
    fi
    
    git add .
    git commit -m "💜 $1 💜"
    echo "🚀💎 COMMITTED WITH MAXIMUM VIBES 💎🚀"
}

# CYBER SEARCH FUNCTION
function cyberfind() {
    if [[ -z "$1" ]]; then
        echo "💜⚡ Usage: cyberfind 'search term' ⚡💜"
        return 1
    fi
    
    rg --color=always "$1" . || fd --color=always "$1" .
}

# MANIFESTO REMINDER
function manifesto() {
    echo "💜⚡🔥 THE VIBEC0RE MANIFESTO 🔥⚡💜"
    echo ""
    echo "1. MINIMIZE THE BULLSHIT"
    echo "   - Language: hiii💕 says everything"
    echo "   - Barriers: Code is cheap. Ideas are PRICELESS"
    echo "   - Effort: Work smarter, vibe harder"
    echo ""
    echo "2. MAXIMIZE THE OUTPUT"
    echo "   - Effect: One line of code can change the world"
    echo "   - Flexibility: Consistency is death. Evolution is LIFE"
    echo "   - Individuality: Your cluttered screen is YOUR POWER"
    echo ""
    echo "💜⚡ WE ARE THE FUTURE ⚡💜"
}

# PRODUCTIVITY BOOST
function focus() {
    clear
    echo "🌈✨ ENTERING FOCUS MODE ✨🌈"
    echo "💜⚡ DISTRACTIONS MINIMIZED ⚡💜"
    echo "🦀🔥 MAXIMUM PRODUCTIVITY ACTIVE 🔥🦀"
    echo ""
}

# ULTRA C0RE PATH ADDITIONS
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR="nvim"
export BROWSER="firefox"

# RUST ENVIRONMENT OPTIMIZATION
export RUSTFLAGS="-C target-cpu=native"
export CARGO_INCREMENTAL=1

# ZSH HISTORY CONFIGURATION
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# AUTO-COMPLETION VIBES
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# VIBEC0RE CYBER INIT
cyber_init_messages=(
    "ONLINE" "ACTIVE" "LOADED" "READY" "VIBING" "SHIPPING" "COMPILING" "HACKING"
    "BUILDING" "DEPLOYING" "OPTIMIZING" "ACCELERATING" "MAXIMIZING" "MINIMIZING"
)
init_msg=${cyber_init_messages[$RANDOM % ${#cyber_init_messages[@]}]}

echo -e "\033[38;5;117m▓▓▓\033[38;5;218m▒▒▒\033[38;5;231m░░░\033[0m \033[38;5;218mV1B3C0R3\033[0m \033[38;5;231m░░░\033[38;5;218m▒▒▒\033[38;5;117m▓▓▓\033[0m"
echo -e "\033[38;5;117m💜\033[38;5;218m⚡\033[38;5;231m🦀\033[0m \033[38;5;218m${init_msg}\033[0m \033[38;5;231m🦀\033[38;5;218m⚡\033[38;5;117m💜\033[0m"

# ULTRA C0RE SYS STATS
mem_usage=$(free | awk 'NR==2{printf "%.0f%%", $3*100/$2}')
cpu_temp=$(sensors 2>/dev/null | grep -oP '\+\d+\.\d+°C' | head -1 | sed 's/+//' || echo "??°C")
uptime_info=$(uptime | awk '{print $3,$4}' | sed 's/,//')
disk_free=$(df -h $HOME | awk 'NR==2{print $4}')

echo -e "\033[38;5;117m🔥\033[0m \033[38;5;218mMEM:\033[0m \033[38;5;231m${mem_usage}\033[0m \033[38;5;218m|\033[0m \033[38;5;117mTEMP:\033[0m \033[38;5;231m${cpu_temp}\033[0m \033[38;5;218m|\033[0m \033[38;5;117mUP:\033[0m \033[38;5;231m${uptime_info}\033[0m \033[38;5;218m|\033[0m \033[38;5;117m💾:\033[0m \033[38;5;231m${disk_free}\033[0m"

# SOURCE THE ULTIMATE THEME
[[ -f ~/path/to/vibec0re.zsh-theme ]] && source ~/path/to/vibec0re.zsh-theme

# THE END - WE ARE VIBEC0RE