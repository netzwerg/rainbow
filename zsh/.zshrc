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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
