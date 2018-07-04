# Reset Colors
Color_Off='\e[0m'            # Text Reset
Color_Off_='\[\e[0m\]'       # Text Reset

BPurple='\e[1;35m'           # Purple
BWhite='\e[1;37m'            # White

#===  FUNCTION  ================================================================
#          NAME:  trunc_pwd
#   DESCRIPTION:  Creates a truncated pwd if the pwd has a length greater than
#                 the amount of chars defined by max_pwd
#       RETURNS:  Returns nothing but creates an updated 'newPWD' variable that
#                 is used with the PROMPT_COMMAND to create a custom prompt
#===============================================================================
function trunc_pwd()
{
max_pwd=30
if [ $(echo $(pwd) | sed -e "s_${HOME}_~_" | wc -c | tr -d " ") -gt $max_pwd ]
then
  newPWD="...$(echo $(pwd) | sed -e "s_${HOME}_~_" | sed -e "s/.*\(.\{$max_pwd\}\)/\1/")"
else
  newPWD="$(echo $(pwd) | sed -e "s_${HOME}_~_")"
fi
}
PROMPT_COMMAND=trunc_pwd
PS1="$BPurple($BWhite\$newPWD$BPurple)\$ $Color_Off"

#===============================================================================
# Settings
#===============================================================================
export HISTCONTROL=ignoredups
# shopt -s checkwinsize
set -o noclobber
export EDITOR=vim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ERL_AFLAGS="-kernel shell_history enabled"


#===============================================================================
#  Aliases
#===============================================================================
alias bye='sudo shutdown -h now'
alias update='sudo apt-get update && sudo apt-get upgrade'
alias upgrade='sudo apt-get upgrade'
alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ls='ls'
# Empty the trash folder that is created when you delete things as root
alias root_trash='sudo bash -c "exec rm -r /root/.local/share/Trash/{files,info}/*"'
alias ll='ls -lh'
alias la='ls -la'
alias l='ls'
alias lls='ll -Sr'
alias less='less -imJMW'
alias tmux="TERM=screen-256color-bce tmux"  # Fix tmux making vim colors funky
alias ping='ping -c 5'
alias startdb='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stopdb='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias gs='git status'
alias gd='git diff'
alias gca='git commit --amend'
alias gc='git commit -m'
alias gca='git commit --amend'
alias goc="git checkout"
alias gr='git reset HEAD~'
alias push='git push origin master'
alias gpush='git push'
alias gpushset='git push --set-upstream origin'
alias list-branches="git branch --sort=committerdate"
alias pushf='git push --force-with-lease'
alias pull='git pull --rebase'
alias ts='tig status'
alias tmuxh='tmux attach -t host-session || tmux new-session -s host-session'
alias tmuxp='tmux attach -t pair-session || tmux new-session -t host-session -s pair-session'
alias rogue='tmux switch-client -t "pair-session"; tmux display-message "Entering Rogue Mode"'
alias buddy='tmux switch-client -t "host-session"; tmux display-message "Entering Buddy Mode"'
alias delete_pyc='find . -name \*.pyc -exec rm \{\} \+'
alias c='clear'
alias nombom="rm -rf node_modules && npm install"
alias es='ember s'
alias em='ember s --environment=mirage-development'
alias et='ember t -s'
alias etf='ember t -s -f'
alias ets='ember t -s -f scott'
alias ni='npm install'
alias mixclean='mix deps.clean --unused --unlock'
alias python='python3'
# export PATH='/usr/local/bin:/Users/snewcomer/.nvm/versions/node/v8.11.3/bin:/Users/snewcomer/.asdf/bin:/Users/snewcomer/.asdf/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'\n
