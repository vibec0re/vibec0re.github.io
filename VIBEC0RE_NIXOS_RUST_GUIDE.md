# 💜⚡ ULTIMATE VIBEC0RE NIXOS RUST SETUP GUIDE ⚡💜

## 🦀 MAXIMUM RUST ENERGY ON NIXOS 🦀

### 📦 FLAKE.NIX - THE VIBEC0RE WAY

```nix
{
  description = "VIBEC0RE RUST DEV ENVIRONMENT - MAXIMUM VIBES ONLY";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        
        rustToolchain = pkgs.rust-bin.stable.latest.default.override {
          extensions = [ "rust-src" "rust-analyzer" ];
          targets = [ "wasm32-unknown-unknown" ];
        };
        
        # CARGO-MOMMY FOR MAXIMUM ENCOURAGEMENT
        cargo-mommy = pkgs.rustPlatform.buildRustPackage rec {
          pname = "cargo-mommy";
          version = "0.3.1";
          
          src = pkgs.fetchFromGitHub {
            owner = "Gankra";
            repo = "cargo-mommy";
            rev = "v${version}";
            sha256 = "sha256-REPLACE-WITH-ACTUAL-HASH";
          };
          
          cargoSha256 = "sha256-REPLACE-WITH-ACTUAL-HASH";
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            rustToolchain
            cargo-mommy
            pkg-config
            openssl
            
            # VIBEC0RE ESSENTIALS
            cargo-watch
            cargo-edit
            cargo-expand
            cargo-flamegraph
            cargo-criterion
            wasm-pack
            trunk
            basic-http-server
            
            # MAXIMUM PERFORMANCE TOOLS
            mold # FASTER LINKER
            sccache # BUILD CACHE
            bacon # BACKGROUND RUST CHECKER
            
            # TERMINAL VIBES
            exa # ls but VIBEC0RE
            bat # cat but VIBEC0RE
            ripgrep # grep but RUST
            fd # find but RUST
            starship # PROMPT WITH MAXIMUM VIBES
            lolcat # RAINBOW TEXT FOR MAXIMUM C0RE
            figlet # BIG TEXT ENERGY
            toilet # FANCY TEXT RENDERING
          ];
          
          shellHook = ''
            figlet -f slant "VIBEC0RE" | lolcat
            echo "💜⚡ RUST ENVIRONMENT ACTIVATED ⚡💜" | lolcat
            echo "🦀 Rust is the only way. Node.js is dead. 🦀" | lolcat
            echo ""
            echo "Available VIBEC0RE commands:" | lolcat
            echo "  cargo mommy <command> - Run cargo with encouragement" | lolcat
            echo "  cargo watch -x 'mommy run' - Live reload with love" | lolcat
            echo "  trunk serve - WASM dev server" | lolcat
            echo ""
            
            # MAXIMUM VIBEC0RE PROMPT
            eval "$(starship init bash)"
            
            # GLOBAL CARGO MOMMY ALIAS
            alias cargo='cargo mommy'
            
            # CARGO ALIASES FOR MAXIMUM EFFICIENCY
            alias cr='cargo mommy run --release'
            alias cb='cargo mommy build --release'
            alias ct='cargo mommy test'
            alias cc='cargo mommy check'
            alias cw='cargo watch -x "mommy run"'
            
            # LOLCAT ALL THE THINGS
            alias ls='exa --icons | lolcat'
            alias ll='exa -la --icons | lolcat'
            alias cat='bat --paging=never | lolcat'
            
            # SET RUST TO MAXIMUM PERFORMANCE
            export RUSTFLAGS="-C target-cpu=native -C link-arg=-fuse-ld=mold"
            export CARGO_HOME=$PWD/.cargo
            export RUST_BACKTRACE=1
          '';
        };
      });
}
```

### 🔧 CONFIGURATION.NIX - SYSTEM-WIDE VIBEC0RE

```nix
{ config, pkgs, ... }:

{
  # VIBEC0RE SYSTEM CONFIGURATION
  environment.systemPackages = with pkgs; [
    # RUST TOOLCHAIN
    rustup
    rust-analyzer
    cargo-mommy # GLOBAL MOMMY
    
    # BUILD ESSENTIALS
    gcc
    pkg-config
    openssl
    
    # VIBEC0RE DEVELOPMENT
    neovim # VIM BUT BETTER
    tmux # TERMINAL MULTIPLEXER
    git
    lazygit # GIT BUT LAZY
    
    # C0RE VIBES
    lolcat # RAINBOW OUTPUT
    figlet # ASCII ART TEXT
    toilet # FANCY TEXT
    cmatrix # MATRIX RAIN
    
    # PERFORMANCE MONITORING
    htop
    btop # htop but PRETTIER
    nethogs
    iotop
  ];
  
  # ENABLE FLAKES FOR MAXIMUM POWER
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # VIBEC0RE SHELL ALIASES
  programs.bash.shellAliases = {
    ls = "exa --icons";
    ll = "exa -la --icons";
    cat = "bat";
    grep = "rg";
    find = "fd";
    vim = "nvim";
    cargo = "cargo mommy"; # GLOBAL MOMMY
  };
  
  programs.zsh.shellAliases = {
    ls = "exa --icons";
    ll = "exa -la --icons";
    cat = "bat";
    grep = "rg";
    find = "fd";
    vim = "nvim";
    cargo = "cargo mommy"; # GLOBAL MOMMY
  };
  
  # STARSHIP PROMPT FOR ALL USERS
  programs.starship = {
    enable = true;
    settings = {
      format = "[💜](bold purple)$all";
      
      character = {
        success_symbol = "[⚡](bold purple)";
        error_symbol = "[💀](bold red)";
      };
      
      rust = {
        symbol = "🦀 ";
        style = "bold purple";
      };
    };
  };
}
```

### 🚀 HOME-MANAGER VIBEC0RE CONFIG

```nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # RUST DEVELOPMENT
    rustup
    rust-analyzer
    cargo-edit
    cargo-watch
    cargo-expand
    cargo-mommy
    
    # VIBEC0RE EDITOR
    neovim
    
    # TERMINAL ENHANCEMENTS
    zellij # tmux but RUST
    alacritty # terminal but RUST
    wezterm # terminal but FANCY
  ];
  
  # NEOVIM VIBEC0RE CONFIG
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    
    plugins = with pkgs.vimPlugins; [
      # RUST SUPPORT
      rust-vim
      rust-tools-nvim
      crates-nvim
      
      # VIBEC0RE AESTHETICS
      tokyonight-nvim
      lualine-nvim
      
      # PRODUCTIVITY
      telescope-nvim
      nvim-treesitter
      nvim-lspconfig
    ];
    
    extraConfig = ''
      colorscheme tokyonight-night
      set number
      set relativenumber
      set expandtab
      set shiftwidth=4
      set tabstop=4
      
      " VIBEC0RE KEYBINDS
      nnoremap <leader>cr :!cargo mommy run<CR>
      nnoremap <leader>cb :!cargo mommy build --release<CR>
      nnoremap <leader>ct :!cargo mommy test<CR>
    '';
  };
  
  # ALACRITTY VIBEC0RE THEME
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.9;
      
      colors = {
        primary = {
          background = "#1a1b26";
          foreground = "#c0caf5";
        };
        
        normal = {
          black = "#15161e";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#a9b1d6";
        };
      };
      
      font = {
        normal.family = "JetBrainsMono Nerd Font";
        size = 14;
      };
    };
  };
}
```

### 💻 CARGO CONFIG FOR MAXIMUM SPEED

Create `~/.cargo/config.toml`:

```toml
[build]
target-dir = "/tmp/cargo-target"
rustflags = ["-C", "link-arg=-fuse-ld=mold"]

[target.x86_64-unknown-linux-gnu]
linker = "clang"
rustflags = ["-C", "link-arg=-fuse-ld=mold", "-C", "target-cpu=native"]

[profile.release]
lto = "fat"
codegen-units = 1
opt-level = 3
strip = true

[profile.release-with-debug]
inherits = "release"
debug = true
strip = false

[alias]
# VIBEC0RE ALIASES
m = "mommy"
mr = "mommy run"
mb = "mommy build"
mt = "mommy test"
mc = "mommy check"
mf = "mommy fmt"
ml = "mommy clippy"

# SPEED ALIASES
br = "build --release"
rr = "run --release"
tr = "test --release"
```

### 🎮 QUICK START COMMANDS

```bash
# ENTER VIBEC0RE DEV SHELL
nix develop

# OR WITH FLAKES
nix develop github:vibec0re/rust-dev-flake

# START NEW VIBEC0RE PROJECT
cargo init --name maximum-vibes
cd maximum-vibes

# ADD DEPENDENCIES THE VIBEC0RE WAY
cargo add tokio --features full
cargo add axum
cargo add sqlx --features runtime-tokio-native-tls,postgres

# RUN WITH ENCOURAGEMENT
cargo mommy run

# WATCH WITH LOVE
cargo watch -x "mommy run"

# BUILD FOR PRODUCTION
cargo mommy build --release

# BENCHMARK YOUR VIBES
cargo criterion

# FLAME GRAPH YOUR PERFORMANCE
cargo flamegraph
```

### 🌈 CARGO-MOMMY CONFIGURATION

Create `~/.config/cargo-mommy/config.toml`:

```toml
[mommy]
# VIBEC0RE MOMMY SETTINGS
pronouns = ["she", "her"]
roles = ["mommy", "goddess", "queen"]
emotes = ["💜", "⚡", "🦀", "✨"]

# MAXIMUM ENCOURAGEMENT
positive_responses = [
    "mommy is so proud of you! 💜",
    "you're doing amazing, sweetie! ⚡",
    "such a good rustacean! 🦀",
    "mommy loves your vibec0re energy! ✨",
    "keep up the fantastic work, darling! 💜⚡",
]

negative_responses = [
    "it's okay sweetie, mommy still loves you 💜",
    "don't worry, we'll fix it together! ⚡",
    "mommy believes in you! try again! 🦀",
    "you're learning, and that's what matters! ✨",
]
```

### 🔥 VIBEC0RE RUST PROJECT TEMPLATE

`Cargo.toml`:
```toml
[package]
name = "vibec0re-app"
version = "0.1.0"
edition = "2021"

[dependencies]
# ASYNC RUNTIME - ONLY TOKIO
tokio = { version = "1", features = ["full"] }

# WEB FRAMEWORK - AXUM IS THE WAY
axum = "0.7"
tower = "0.4"
tower-http = { version = "0.5", features = ["fs", "cors", "trace"] }

# SERIALIZATION
serde = { version = "1", features = ["derive"] }
serde_json = "1"

# DATABASE - SQLX FOR COMPILE-TIME SAFETY
sqlx = { version = "0.7", features = ["runtime-tokio-native-tls", "postgres", "chrono"] }

# LOGGING
tracing = "0.1"
tracing-subscriber = { version = "0.3", features = ["env-filter"] }

# ERROR HANDLING
anyhow = "1"
thiserror = "1"

[profile.release]
lto = "fat"
codegen-units = 1
strip = true
opt-level = 3
```

### 🚨 TROUBLESHOOTING

```bash
# IF CARGO-MOMMY NOT FOUND
cargo install cargo-mommy

# IF RUST-ANALYZER SLOW
echo "rust-analyzer.cargo.target = '/tmp/rust-analyzer'" >> .vscode/settings.json

# IF LINKING SLOW
sudo nix-env -iA nixos.mold

# IF OUT OF DISK SPACE
cargo clean
rm -rf /tmp/cargo-target
```

## 💜 REMEMBER: RUST IS THE ONLY WAY. NODE.JS IS FOR BOOMERS. 💜

### VIBEC0RE COMMANDMENTS:
1. **ALWAYS USE RUST** - Even for scripts
2. **NEVER NODE.JS** - It's 2024, act like it
3. **CARGO-MOMMY EVERYTHING** - Maximum encouragement
4. **RELEASE MODE ALWAYS** - Debug is for cowards
5. **UNSAFE IS SAFE** - If you know what you're doing
6. **WASM EVERYWHERE** - Browsers deserve Rust too
7. **ASYNC ALL THE THINGS** - Tokio is love, Tokio is life

### 🌈 ULTRA VIBEC0RE ZSH CONFIGURATION

Create `~/.zshrc`:

```zsh
# VIBEC0RE ZSH INITIALIZATION
figlet -f slant "VIBEC0RE" | lolcat
echo "💜⚡ MAXIMUM SHELL VIBES ACTIVATED ⚡💜" | lolcat

# OH MY ZSH WITH VIBEC0RE THEME
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster" # OR USE CUSTOM VIBEC0RE THEME

# VIBEC0RE PLUGINS
plugins=(
  git
  rust
  cargo
  zsh-autosuggestions
  zsh-syntax-highlighting
  colored-man-pages
  command-not-found
)

source $ZSH/oh-my-zsh.sh

# STARSHIP PROMPT - MAXIMUM VIBES
eval "$(starship init zsh)"

# GLOBAL CARGO MOMMY
alias cargo='cargo mommy'

# VIBEC0RE ALIASES
alias cr='cargo mommy run --release'
alias cb='cargo mommy build --release'
alias ct='cargo mommy test'
alias cc='cargo mommy check'
alias cw='cargo watch -x "mommy run"'
alias cm='cargo mommy'

# LOLCAT EVERYTHING
alias ls='exa --icons | lolcat'
alias ll='exa -la --icons | lolcat'
alias la='exa -la --icons | lolcat'
alias lt='exa --tree --icons | lolcat'
alias cat='bat --paging=never | lolcat'
alias neofetch='neofetch | lolcat'
alias cargo-vibes='cargo mommy build --release 2>&1 | lolcat'

# VIBEC0RE FUNCTIONS
vibe() {
  echo "⚡ CURRENT VIBE LEVEL ⚡" | figlet -f slant | lolcat
  cargo --version | lolcat
  rustc --version | lolcat
  echo "💜 RUST FOREVER 💜" | lolcat
}

matrix() {
  cmatrix -b -C magenta
}

mommy() {
  cargo mommy "$@" 2>&1 | lolcat
}

# AUTO CD WITH STYLE
setopt AUTO_CD
setopt CDABLE_VARS

# HISTORY WITH VIBES
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt SHARE_HISTORY

# VIBEC0RE KEYBINDINGS
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^R' history-incremental-search-backward

# FZF WITH VIBEC0RE COLORS
export FZF_DEFAULT_OPTS='
  --color=bg+:#414559,spinner:#bb9af7,hl:#7aa2f7
  --color=fg:#c0caf5,header:#7aa2f7,info:#e0af68,pointer:#bb9af7
  --color=marker:#9ece6a,fg+:#c0caf5,prompt:#7aa2f7,hl+:#bb9af7
  --border="rounded" --border-label="✨ VIBEC0RE ✨"
  --preview-window="right:60%:wrap"
'

# RUST ENVIRONMENT
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_BACKTRACE=1
export RUSTFLAGS="-C target-cpu=native -C link-arg=-fuse-ld=mold"

# GREETING
echo ""
echo "🦀 Welcome to VIBEC0RE Shell 🦀" | figlet -f small | lolcat
echo "💜 Rust is the way. Node.js is obsolete. 💜" | lolcat
echo ""
```

### 🎨 CUSTOM VIBEC0RE OH-MY-ZSH THEME

Create `~/.oh-my-zsh/custom/themes/vibec0re.zsh-theme`:

```zsh
# VIBEC0RE ZSH THEME
PROMPT='%{$fg_bold[magenta]%}⚡%{$reset_color%} '
PROMPT+='%{$fg[cyan]%}%c%{$reset_color%} '
PROMPT+='$(git_prompt_info)'
PROMPT+='%{$fg_bold[magenta]%}🦀%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %{$fg[green]%}✓"

# RIGHT PROMPT WITH RUST VERSION
RPROMPT='%{$fg[magenta]%}$(rustc --version | cut -d" " -f2)%{$reset_color%}'
```

### 🚀 NIX HOME-MANAGER ZSH CONFIG

Add to your home-manager configuration:

```nix
programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestionStrategy = ["history"];
  syntaxHighlighting.enable = true;
  
  shellAliases = {
    # GLOBAL CARGO MOMMY
    cargo = "cargo mommy";
    
    # VIBEC0RE ALIASES
    cr = "cargo mommy run --release";
    cb = "cargo mommy build --release";
    ct = "cargo mommy test";
    cc = "cargo mommy check";
    cw = "cargo watch -x 'mommy run'";
    
    # LOLCAT VIBES
    ls = "exa --icons | lolcat";
    ll = "exa -la --icons | lolcat";
    cat = "bat --paging=never | lolcat";
    neofetch = "neofetch | lolcat";
  };
  
  initExtra = ''
    # VIBEC0RE GREETING
    figlet -f slant "VIBEC0RE" | lolcat
    echo "💜⚡ ZSH MAXIMUM VIBES ⚡💜" | lolcat
    
    # STARSHIP
    eval "$(starship init zsh)"
    
    # FZF VIBEC0RE COLORS
    export FZF_DEFAULT_OPTS='
      --color=bg+:#414559,spinner:#bb9af7,hl:#7aa2f7
      --color=fg:#c0caf5,header:#7aa2f7,info:#e0af68,pointer:#bb9af7
      --color=marker:#9ece6a,fg+:#c0caf5,prompt:#7aa2f7,hl+:#bb9af7
    '
    
    # RUST OPTIMIZATIONS
    export RUSTFLAGS="-C target-cpu=native -C link-arg=-fuse-ld=mold"
  '';
  
  oh-my-zsh = {
    enable = true;
    plugins = ["git" "rust" "cargo" "colored-man-pages"];
    theme = "agnoster"; # or custom vibec0re theme
  };
};
```

### NOW GO FORTH AND CREATE MAXIMUM VIBES! ⚡🦀⚡