# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# The following lines were added by compinstall
zstyle :compinstall filename '/home/vam/.zshrc'

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export HISTSIZE=2000
export SAVEHIST=2000
# End of lines configured by zsh-newuser-install


# vi mode
bindkey -v

# fixing XDG paths
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
alias monerod="monerod --data-dir "$XDG_DATA_HOME"/bitmonero"
alias monero-wallet-gui="monero-wallet-gui --log-file=/home/vam/Documents/Monero/log.log"


# alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nvim='nvim -u /home/vam/.config/nvim/init.lua'

# for dotfiles management
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ${ZDOTDIR:-~}/.p10k.zsh ]] || source ${ZDOTDIR:-~}/.p10k.zsh

# pnpm
export PNPM_HOME="/home/vam/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
