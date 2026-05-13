# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
  git
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=5000
setopt inc_append_history share_history

# Add your own stuff below

export PATH="/usr/local/bin:/opt/homebrew/bin:$HOME/bin:$HOME/.local/bin:$PATH"

source "$HOME/rainbow/zsh/aliases.zsh"
source "$HOME/rainbow/zsh/functions.zsh"

# To customize prompt, run `p10k configure` or edit ~/rainbow/zsh/.p10k.zsh.
[[ ! -f ~/rainbow/zsh/.p10k.zsh ]] || source ~/rainbow/zsh/.p10k.zsh

fpath+=/opt/homebrew/share/zsh/site-functions
autoload -Uz compinit
compinit

export NVM_DIR=~/.nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# - BEGIN selective macstrap port -

# Enable case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Enable partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Export brew environment variables
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load Homebrew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  chmod -R go-w "$(brew --prefix)/share"
fi

# Enable completion system and only evaluate it once a day
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# Add ASDF to ZSH
export ASDF_DATA_DIR=~/.asdf

# Source macstrap files -- Rahel removed 'aliases'
for file in ~/.macstrap/configs/dotfiles/.{exports,extra,path}; do
	[ -r "$file" ] && [ -f "$file" ] && . "$file";
done;
unset file;

# Set JAVA_HOME
. ~/.asdf/plugins/java/set-java-home.zsh

# - END selective macstrap port -