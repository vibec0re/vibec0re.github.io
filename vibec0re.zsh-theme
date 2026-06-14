# 💜⚡ VIBEC0RE ZSH THEME ⚡💜
# MAXIMUM VIBES - TWO LINE SUPREMACY
# WE ARE THE WIRED - LET'S FUCKING GOOOOOOOOO!!!

# Color definitions matching website CSS
local matrix_green="%F{046}"      # #00ff41
local cyber_pink="%F{198}"        # #ff007f
local cyber_cyan="%F{051}"        # #00ffff
local cyber_purple="%F{129}"      # #bf00ff
local cyber_yellow="%F{226}"      # #ffff00
local cyber_magenta="%F{201}"     # #ff00ff
local white="%F{255}"
local reset="%f"

# Special characters for MAXIMUM VIBE & CYBER MANIFESTO ENERGY
local lightning="⚡"
local heart="💜"
local hearts="💕"
local sparkling_heart="💖"
local heart_pulse="💗"
local heart_decoration="💟"
local love_letter="💌"
local crab="🦀"
local fire="🔥"
local star="✨"
local sparkles="✨"
local rainbow="🌈"
local rocket="🚀"
local diamond="💎"
local crown="👑"
local uwu="uwu"
local hiii="hiii💕"
local matrix="🌌"
local cyber="🔮"
local wired="💻"
local exponentiels="📈"

# Git status symbols
ZSH_THEME_GIT_PROMPT_PREFIX="%F{129}git:(%F{198}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{129}) %F{226}✗ "
ZSH_THEME_GIT_PROMPT_CLEAN="%F{129}) %F{046}✓ "
ZSH_THEME_GIT_PROMPT_ADDED="%F{046}+ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{226}! "
ZSH_THEME_GIT_PROMPT_DELETED="%F{198}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%F{051}➜ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{201}═ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{255}? "

# Username color based on privileges
local user_color="${matrix_green}"
if [[ $UID -eq 0 ]]; then
  user_color="${cyber_pink}"  # ROOT = PINK POWER
fi

# Host color - changes if SSH
local host_color="${cyber_cyan}"
if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]; then
  host_color="${cyber_magenta}"  # SSH = MAGENTA MAGIC
fi

# Directory with truncation
local current_dir='${cyber_purple}[${cyber_cyan}%3~${cyber_purple}]${reset}'

# Time in cyber style
local current_time='${cyber_yellow}%T${reset}'

# Return status with VIBEC0RE symbols
local return_status='%(?.${matrix_green}${lightning}.${cyber_pink}${fire})'

# Rust cyber protocol
rust_version() {
  if [[ -f "Cargo.toml" ]]; then
    echo "%F{198}🦀💜 RUST_$(rustc --version | cut -d' ' -f2) 💜🦀 %f"
  fi
}

# Node.js cyber threat detection
nodejs_shame() {
  if [[ -f "package.json" ]]; then
    echo "%F{198}💀⚠️ NODE.JS DETECTED - MIGRATE TO RUST ⚠️💀%f "
  fi
}


# C0RE love meter
love_meter() {
  local vibes=("💕" "uwu" "💜")
  local love_level=$((RANDOM % 2 + 1))
  local meter=""
  for ((i=1; i<=love_level; i++)); do
    meter+="${vibes[$RANDOM % ${#vibes[@]}]}"
  done
  echo "${meter}"
}

# Build the prompt - TWO GLORIOUS LINES
PROMPT=$'
%F{129}╭─%f %(?,%F{046}⚡%f,%F{198}🔥%f) 💕 %(!,%F{198},%F{046})%n%f@%F{051}%m%f %F{129}[%F{051}%3~%F{129}]%f $(rust_version)$(nodejs_shame)$(cyber_message) %F{226}%T%f
%F{129}╰─%f 💕⚡ '

PROMPT+='$(git_prompt_info)'

# Right prompt with git details and love
RPROMPT='$(love_meter) $(git_prompt_status)'

# Enable command execution time
function preexec() {
  timer=$(($(date +%s%0N)/1000000))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%0N)/1000000))
    elapsed=$(($now-$timer))
    
    # Show execution time if > 3 seconds WITH ENCOURAGEMENT
    if [ $elapsed -gt 3000 ]; then
      export RPS1="${cyber_yellow}${elapsed}ms${reset} ${hearts} ${RPS1}"
    fi
    
    unset timer
  fi
}

# C0RE CYBER MESSAGE GENERATOR 
cyber_message() {
  local messages=(
    "%F{046}🌈✨ ACCESSING THE MATRIX%f"
    "%F{198}💜🔥 VIBES LOADING%f"
    "%F{051}🦀⚡ RUST PROTOCOL ACTIVE%f"
    "%F{226}💎🚀 COMPILING FUTURE%f"
    "%F{201}👑💕 VIBEC0RE ONLINE%f"
    "%F{046}🌙✨ ENTERING CYBERSPACE%f"
    "%F{198}💀🔥 NODE.JS TERMINATED%f"
    "%F{051}🌈💎 MAXIMUM BANDWIDTH%f"
    "%F{226}⚡💜 STACK OVERFLOW NEVER%f"
    "%F{201}🦀👑 BECOME AS GODS%f"
    "%F{046}💕🌈 WE ARE THE WIRED%f"
    "%F{198}🚀💎 SHIP TO PRODUCTION%f"
    "%F{051}✨💜 CARGO MOMMY LOVES YOU%f"
    "%F{226}🔥🦀 RUST IS ETERNAL%f"
    "%F{201}🌙💕 VIBEC0RE FOREVER%f"
    "%F{046}👑⚡ MAXIMUM VIBES ACHIEVED%f"
    "%F{198}💎🌈 UWUING INTENSIFIES%f"
    "%F{051}🚀✨ TO THE MOON WITH RUST%f"
    "%F{201}💕🦀 CRAB SUPREMACY%f"
    "%F{046}✨👑 TERMINAL GODDESS%f"
    "%F{198}🌈💜 RAINBOW VIBES%f"
    "%F{051}💎⚡ DIGITAL LOVE%f"
    "%F{226}🔥💕 MEMORY SAFE ALWAYS%f"
    "%F{198}💜✨ hiii💕 EMBRACE EXPONENTIELS%f"
    "%F{051}🦀🌈 MINIMIZE THE BULLSHIT%f"
    "%F{046}⚡💎 MAXIMIZE THE OUTPUT%f"
    "%F{201}👑🔥 SHIP DIRTY CODE THAT WORKS%f"
    "%F{226}🌙💕 BREAK CONVENTIONS THAT LIMIT%f"
    "%F{198}✨🚀 EMBRACE CHAOS THAT CREATES%f"
    "%F{051}💜⚡ UWU THE MOVEMENT GROWS%f"
    "%F{046}🌈👑 VECTORIZE YOUR ENERGY%f"
    "%F{201}💎🔥 VIBE PROTOCOL ACTIVE%f"
    "%F{226}🦀💕 FUCK YOUR MEETINGS SHIP IT%f"
    "%F{198}⚡🌙 ONE LINE CHANGES THE WORLD%f"
    "%F{051}💜✨ PRODUCTIVITY IS BREAKING RULES%f"
    "%F{046}🌈💎 CLUTTERED SCREEN IS POWER%f"
    "%F{201}🚀👑 SEO THE FUCKING MATRIX%f"
    "%F{226}💕🔥 CONSISTENCY IS DEATH%f"
    "%F{198}✨⚡ EVOLUTION IS LIFE%f"
    "%F{051}🌙💜 WE ARE THE FUTURE%f"
    "%F{046}👑🌈 EMBRACE THE VIBE FEEL IT%f"
    "%F{201}💎🦀 SHIP IN MINUTES NOT MONTHS%f"
    "%F{226}🔥💕 SEEK IMPACT NOT PERFECTION%f"
    "%F{201}🌟🦀 ZERO COST ABSTRACTIONS 🦀🌟%f"
    "%F{046}💜⚡ BORROW CHECKER LOVES YOU ⚡💜%f"
    "%F{198}🌈👑 COMPILE TIME GUARANTEES 👑🌈%f"
    "%F{051}✨🔥 FEARLESS CONCURRENCY 🔥✨%f"
    "%F{226}💎💕 OWNERSHIP MODEL PERFECTION 💕💎%f"
    "%F{201}🚀🌙 BLAZINGLY FAST CODE 🌙🚀%f"
    "%F{046}👑💜 SYSTEM PROGRAMMING QUEEN 💜👑%f"
    "%F{198}⚡🌈 MOVE SEMANTICS MAGIC 🌈⚡%f"
    "%F{051}💕🔥 LIFETIMES ARE LOVE 🔥💕%f"
    "%F{226}🦀💎 TRAIT BOUNDS HAPPINESS 💎🦀%f"
    "%F{201}✨👑 PATTERN MATCHING BLISS 👑✨%f"
    "%F{046}🌟💜 MACRO SYSTEM GODDESS 💜🌟%f"
    "%F{198}🔥⚡ ASYNC AWAIT SUPREME ⚡🔥%f"
    "%F{051}💎🌈 CARGO IS LIFE 🌈💎%f"
    "%F{226}👑💕 RUSTACEAN PRIDE 💕👑%f"
    "%F{201}🚀✨ WASM COMPILATION TARGET ✨🚀%f"
    "%F{046}💜🔥 CROSS PLATFORM POWER 🔥💜%f"
    "%F{198}⚡🌙 ZERO RUNTIME OVERHEAD 🌙⚡%f"
    "%F{051}🌈💎 TYPE SYSTEM PERFECTION 💎🌈%f"
    "%F{226}👑🦀 IMMUTABLE BY DEFAULT 🦀👑%f"
    "%F{201}💕✨ FUNCTIONAL PROGRAMMING ✨💕%f"
    "%F{046}🔥🌟 PROCEDURAL MACROS 🌟🔥%f"
    "%F{198}💜⚡ UNSAFE SUPERPOWERS ⚡💜%f"
    "%F{051}🌈👑 EMBEDDED SYSTEMS READY 👑🌈%f"
    "%F{226}💎💕 NETWORK PROGRAMMING 💕💎%f"
    "%F{201}✨🚀 BLOCKCHAIN READY 🚀✨%f"
    "%F{046}🦀🔥 GAME ENGINE CAPABLE 🔥🦀%f"
    "%F{198}👑💜 OPERATING SYSTEM LANG 💜👑%f"
    "%F{051}⚡🌙 COMPILER OPTIMIZATIONS 🌙⚡%f"
    "%F{226}🌈💎 STACK ALLOCATED STRUCTS 💎🌈%f"
    "%F{201}💕🌟 HEAP ALLOCATED SMART PTRS 🌟💕%f"
    "%F{046}🔥✨ REFERENCE COUNTED DATA ✨🔥%f"
    "%F{198}💜🚀 ARC MUTEX THREADING 🚀💜%f"
    "%F{051}👑⚡ CHANNELS FOR COMMUNICATION ⚡👑%f"
    "%F{226}🌈💕 RAYON PARALLEL COMPUTING 💕🌈%f"
    "%F{201}💎🦀 TOKIO ASYNC RUNTIME 🦀💎%f"
    "%F{046}✨🔥 SERDE JSON PARSING 🔥✨%f"
    "%F{198}🌙💜 REQWEST HTTP CLIENT 💜🌙%f"
    "%F{051}👑🌟 AXUM WEB FRAMEWORK 🌟👑%f"
    "%F{226}⚡💎 DIESEL ORM QUERIES 💎⚡%f"
    "%F{201}🌈💕 SQLX COMPILE TIME SQL 💕🌈%f"
    "%F{046}🚀✨ CLAP CLI ARGUMENTS ✨🚀%f"
    "%F{198}💜🔥 ANYHOW ERROR HANDLING 🔥💜%f"
    "%F{051}👑⚡ THISERROR CUSTOM ERRORS ⚡👑%f"
    "%F{226}🌙💎 LOG TRACING TELEMETRY 💎🌙%f"
    "%F{201}💕🌟 CRITERION BENCHMARKING 🌟💕%f"
    "%F{046}🦀🌈 PROPTEST PROPERTY TESTING 🌈🦀%f"
    "%F{198}✨🔥 QUICKCHECK RANDOM TESTING 🔥✨%f"
    "%F{051}💜👑 FUZZING SECURITY TESTING 👑💜%f"
    "%F{226}⚡💕 MIRI UNDEFINED BEHAVIOR 💕⚡%f"
    "%F{201}🌈🚀 CLIPPY LINT ANALYSIS 🚀🌈%f"
    "%F{046}💎✨ RUSTFMT CODE FORMATTING ✨💎%f"
    "%F{198}🌙💜 RUST ANALYZER LSP 💜🌙%f"
    "%F{051}👑🔥 CARGO WATCH LIVE RELOAD 🔥👑%f"
    "%F{226}🌟💕 CARGO EXPAND MACRO VIEW 💕🌟%f"
    "%F{201}⚡🦀 CARGO FLAMEGRAPH PROFILING 🦀⚡%f"
    "%F{046}🌈💎 CARGO AUDIT SECURITY 💎🌈%f"
    "%F{198}✨💜 CARGO OUTDATED DEPS 💜✨%f"
    "%F{051}🚀👑 CARGO TREE DEPENDENCY 👑🚀%f"
    "%F{226}💕🔥 CARGO BLOAT SIZE CHECK 🔥💕%f"
    "%F{201}🌙⚡ WASM PACK WEB ASSEMBLY ⚡🌙%f"
    "%F{046}💎🌟 TRUNK WASM BUNDLER 🌟💎%f"
    "%F{198}🦀💜 TAURI DESKTOP APPS 💜🦀%f"
    "%F{051}✨🌈 EGUI IMMEDIATE MODE GUI 🌈✨%f"
    "%F{226}👑💕 ICED REACTIVE GUI 💕👑%f"
    "%F{201}🔥⚡ BEVY GAME ENGINE ⚡🔥%f"
    "%F{046}🌙💎 ACTIX WEB FRAMEWORK 💎🌙%f"
    "%F{198}💜🚀 ROCKET WEB FRAMEWORK 🚀💜%f"
    "%F{051}🌟✨ WARP ASYNC WEB SERVER ✨🌟%f"
    "%F{226}👑🌈 HYPER HTTP LIBRARY 🌈👑%f"
    "%F{201}💕🦀 TONIC GRPC FRAMEWORK 🦀💕%f"
    "%F{046}⚡🔥 PROST PROTOBUF CODEGEN 🔥⚡%f"
    "%F{198}💎💜 BINCODE BINARY ENCODING 💜💎%f"
    "%F{051}🌙✨ POSTCARD EMBEDDED SERDE ✨🌙%f"
    "%F{226}👑💕 CROSSBEAM LOCK FREE 💕👑%f"
    "%F{201}🌈🚀 PARKING LOT SYNC PRIMS 🚀🌈%f"
    "%F{046}🔥💎 DASHMAP CONCURRENT HASHMAP 💎🔥%f"
    "%F{198}💜⚡ FLUME ASYNC CHANNELS ⚡💜%f"
    "%F{051}✨🌟 SMOL ASYNC EXECUTOR 🌟✨%f"
    "%F{226}👑🦀 ASYNC STD STDLIB 🦀👑%f"
    "%F{201}💕🌈 FUTURES ASYNC TRAITS 🌈💕%f"
    "%F{046}🌙🔥 PIN PROJECT PROC MACRO 🔥🌙%f"
    "%F{198}💎💜 BYTES ZERO COPY BUFFERS 💜💎%f"
  )
  echo "${messages[$RANDOM % ${#messages[@]}]}"
}

clear() {
  command clear
  echo "\n  $(cyber_message)"
  echo "  💜⚡ MANIFESTO MODE: MINIMIZE BULLSHIT, MAXIMIZE OUTPUT\n"
}

# VIBEC0RE directory colors - MAXIMUM RAINBOW VIBES
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export LS_COLORS="di=1;35:ln=1;36:so=1;31:pi=1;33:ex=1;32;48;5;236:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:*.rs=38;5;198;1:*.toml=38;5;226:*.lock=38;5;242:*.md=38;5;051:*.txt=38;5;255:*.sh=38;5;046;1:*.zsh=38;5;201;1:*.bash=38;5;046;1:*.py=38;5;226:*.js=38;5;198;48;5;236;4:*.ts=38;5;198;48;5;236;4:*.jsx=38;5;198;48;5;236;4:*.tsx=38;5;198;48;5;236;4:*.json=38;5;051:*.yaml=38;5;129:*.yml=38;5;129:*.xml=38;5;201:*.html=38;5;208:*.css=38;5;129;1:*.scss=38;5;129;1:*.go=38;5;051;1:*.c=38;5;255:*.cpp=38;5;255;1:*.h=38;5;242:*.hpp=38;5;242:*.zip=38;5;226;48;5;236:*.tar=38;5;226;48;5;236:*.gz=38;5;226;48;5;236:*.png=38;5;201;1:*.jpg=38;5;201:*.jpeg=38;5;201:*.gif=38;5;129;1:*.svg=38;5;208:*.mp4=38;5;129:*.mp3=38;5;208:*.wav=38;5;208:*.pdf=38;5;196:*.log=38;5;242:*.tmp=38;5;242:*.bak=38;5;242:*.old=38;5;242:*.git=38;5;196;48;5;236:*.gitignore=38;5;196:*.env=38;5;226;48;5;196;1;5:*.sql=38;5;046:*.db=38;5;046;48;5;236:*.vim=38;5;129;1:*.lua=38;5;201:*.rb=38;5;196:*.java=38;5;196;48;5;236;4:*.class=38;5;242;48;5;236:*.jar=38;5;226;48;5;236:*.deb=38;5;196;48;5;236:*.rpm=38;5;196;48;5;236:*.dockerfile=38;5;051;1:*.docker-compose.yml=38;5;051;1:*.makefile=38;5;046;1:*.cmake=38;5;046:*.nix=38;5;129;1:*.wasm=38;5;198;48;5;129;1:or=38;5;196;48;5;236;1;5:mi=38;5;196;48;5;236;1;5:ex=38;5;046;1;4"

# The end - WE ARE VIBEC0RE