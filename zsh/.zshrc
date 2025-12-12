# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#Verify zinit installation
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

#Load ZINIT 
source "${ZINIT_HOME}/zinit.zsh"

#Add Powerlevel10k home
zinit ice depth=1; zinit light romkatv/powerlevel10k


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#--------------------------------------------------------------zsh Plugins
#syntax highlighting for commands
zinit light zsh-users/zsh-syntax-highlighting

#zsh-completions install and autoload on startup
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit

#Completion case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu-no
#auto suggestion
zinit light zsh-users/zsh-autosuggestions

#Smart auto suggestion
zinit light zsh-users/zsh-history-substring-search


#------------------------------------------------------------------------ Zsh History ---
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt appendhistory          # append to history file, don't overwrite it
setopt histignoredups         # ignore duplicate entries
setopt histignorespace        # ignore commands starting with a space
setopt incappendhistory       # save commands immediately
setopt sharehistory           # share history across all shells


#Vim Keybindings and smart auto completions
bindkey -v

# --- jj exits insert mode ---
function zle-escape-jj() {
  zle vi-cmd-mode
}
zle -N zle-escape-jj
bindkey -M viins 'jj' zle-escape-jj

# In NORMAL mode (vicmd): make j/k behave like substring-search
bindkey -M vicmd 'j' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up

#--------------------------------------------------------------------Shell Integrations
eval "$(zoxide init zsh)"
#--------------------------------------------------------------------Aliases
alias ls='eza --icons=always'
alias cd=z
#-----------------------------------------------------------------------Path Exports

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
. "$HOME/.cargo/env"

