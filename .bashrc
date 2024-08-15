# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#export SHELL="/usr/local/bin/bash"

if [[ $TERM = screen ]]; then
	    export TERM=xterm
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PROMPT_COMMAND=__prompt_command

__prompt_command() {
  local EXIT="$?"
  PS1=""

  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
  if [ "${USER}" = "root" ]; then
    if [ $EXIT != 0 ]; then
      PS1='\[\e[31m\]\u\[\e[94m\]@\h\[\e[39m\]\[\e[34m\]${BRANCH}\[\e[39m\] \[\e[93m\]\W\[\e[39m\] \[\e[31m\]\$\[\e[39m\] '
    else
      PS1='\[\e[31m\]\u\[\e[94m\]@\h\[\e[39m\]\[\e[34m\]${BRANCH}\[\e[39m\] \[\e[93m\]\W\[\e[39m\] \[\e[32m\]\$\[\e[39m\] '
    fi
  elif [ "${USER}" = "ansible" ]; then
    if [ $EXIT != 0 ]; then
      PS1='\[\e[95m\]\u\[\e[94m\]@\h\[\e[39m\]\[\e[34m\]${BRANCH}\[\e[39m\] \[\e[93m\]\W\[\e[39m\] \[\e[31m\]\$\[\e[39m\] '
    else
      PS1='\[\e[95m\]\u\[\e[94m\]@\h\[\e[39m\]\[\e[34m\]${BRANCH}\[\e[39m\] \[\e[93m\]\W\[\e[39m\] \[\e[32m\]\$\[\e[39m\] '
    fi
  else
    if [ $EXIT != 0 ]; then
      PS1='\[\e[92m\]\u\[\e[94m\]@\h\[\e[39m\]\[\e[34m\]${BRANCH}\[\e[39m\] \[\e[93m\]\W\[\e[39m\] \[\e[31m\]\$\[\e[39m\] '
    else
      PS1='\[\e[92m\]\u\[\e[94m\]@\h\[\e[39m\]\[\e[34m\]${BRANCH}\[\e[39m\] \[\e[93m\]\W\[\e[39m\] \[\e[32m\]\$\[\e[39m\] '
    fi
  fi
}

alias vi="/usr/local/bin/vim"
alias vim="/usr/local/bin/vim"
alias ls="ls --color=auto"
alias ll="ls --color=auto -lah"
alias git="/usr/local/bin/git"
alias curl="/usr/local/bin/curl"
alias k="kubectl"
#alias python="/usr/local/bin/python3"
#alias python3="/usr/local/bin/python3"
alias s="screen"
alias autoconf="/usr/local/bin/autoconf"
#alias ld="/usr/local/bin/ld"
#alias gcc="gcc-13"
alias tree="tree -C"
alias less="/usr/local/bin/less -R"
alias lesskey="/usr/local/bin/lesskey"
alias lessecho="/usr/local/bin/lessecho"
alias rebase='TMP_BRANCH=$(git branch --show-current); git checkout main; git pull; git checkout ${TMP_BRANCH}; git rebase main'
alias push='git push origin $(git branch --show-current)'

export EDITOR="/usr/local/bin/vim"

source ~/Dev-work/helper-scripts/proxy-handlers/bash/kubectl-auto-proxy.sh

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

#export PATH=~/bin:~/.local/bin:~/go/bin:/usr/sbin:$PATH

#[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go
export GOPATH=$HOME/Documents/go

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export HOMEBREW_CURL_PATH="/usr/local/bin/curl"
export HOMEBREW_GIT_PATH="/usr/local/bin/git"
export HOMEBREW_AUTO_UPDATE_SECS=86400

source ~/Dev-work/helper-scripts/set-cluster/bash/set-cluster-helper.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/jiridokoupil/Dev-linux/google-cloud-sdk/path.bash.inc' ]; then . '/home/jiridokoupil/Dev-linux/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/jiridokoupil/Dev-linux/google-cloud-sdk/completion.bash.inc' ]; then . '/home/jiridokoupil/Dev-linux/google-cloud-sdk/completion.bash.inc'; fi
