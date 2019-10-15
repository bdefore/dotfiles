# [[ -r ~/.profile ]] && source ~/.profile
# [[ -r ~/.bashrc ]] && source ~/.bashrc
# [[ -r ~/.corporate_profiles/learnist ]] && source ~/.corporate_profiles/learnist
# [[ -r ~/.corporate_profiles/academiaedu ]] && source ~/.corporate_profiles/academiaedu
# [[ -r ~/.corporate_profiles/ga ]] && source ~/.corporate_profiles/ga
# [[ -r ~/.corporate_profiles/loc ]] && source ~/.corporate_profiles/loc
[[ -r ~/.corporate_profiles/bcdef ]] && source ~/.corporate_profiles/bcdef
[[ -r ~/.Xmodmap ]] && xmodmap ~/.Xmodmap # TODO: what was this for? galliumos?

export GOROOT=/usr/local/go
export GOPATH=$HOME/go

# Terminal coloring
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# Sublime Text as default editor for those that check this property
export EDITOR='subl'
# export EDITOR='code -w'

alias ls="ls -la"
alias vi=vim

# Git Aliases
alias gs='git status'
# alias gl='git pull'
alias gp='git push'
alias gd='git diff | subl'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias ga='git add -i'
alias gsr='git svn rebase'
alias gsd='git svn dcommit'
alias undo='git reset HEAD~1'
alias d='git diff'

# alias git='hub'
# http://fredkschott.com/post/2014/02/git-log-is-so-2005/
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.recent "for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(authorname) %(refname:short)'"

# Node Aliases
alias npd='npm install -d'
alias npmicache="time npm i --cache-min=1000000" # http://vijayskotecha.blogspot.com/2015/08/2-methods-to-speed-up-you-nodejs-npm.html
alias npmi="npm i && terminal-notifier -message 'npm install complete' -timeout 1"
# alias npmi="if test npm i --cache-min=1000000; then terminal-notifier -title 'npm' -message 'Install completed successfully' ; else terminal-notifier -title 'npm' -message 'Install failed!' ; fi"
alias nrd="npm run dev"
alias rmn="rm -rf node_modules"
alias rei="rm -rf ./node-modules && npmi"
alias nrdr="npm run docker:restart"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# Retired
# alias mvndoit="mvn clean install -PautoInstallPackage"
# alias nave="sh ~/Documents/bash/nave.sh"
# alias alert="open ~/Desktop/BabyElephantWalk.flv"
# alias brack="/Applications/Brackets.app/Contents/MacOS/Brackets"
# alias ur="cd ~/code/universal-redux"
# alias effyoushrinkwrap="rm -r node_modules && git checkout master -- npm-shrinkwrap.json && npm i && rm npm-shrinkwrap.json && npm i && npm shrinkwrap --dev"

function servecode {
  CODE_SERVER_PORT=${2:-8443}
  PASSWORD=$CODE_SERVER_PASSWORD nohup code-server --port $CODE_SERVER_PORT --auth password $1 &
}

alias prof="code ~/.bash_profile"
alias bitch=sudo
alias remotebranches="git for-each-ref --format='%(color:cyan)%(authordate:format:%m/%d/%Y %I:%M %p)    %(align:25,left)%(color:yellow)%(authorname)%(end) %(color:reset)%(refname:strip=3)' --sort=authordate refs/remotes"
alias weather="curl wttr.in"
alias serveide='sudo docker run -it -p 3000:3000 -v "$(pwd):/home/project:cached" theiaide/theia:next'
alias stopdev='killall code-server'
alias servedev="servecode $DEV_HOME"
alias tmuxref='tmux source ~/.tmux-pre.conf && tmux source ~/.tmux.conf'
alias towin='sudo grub-reboot 2 && reboot'

# Pretty display recursively
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# From git source. Adds completions for branches, among other treats
source ~/.gittools/git-completion.bash
source ~/.gittools/git-flow-completion.bash
source ~/.gittools/git-prompt.bash

##################################################
# Fancy PWD display function from https://wiki.archlinux.org/index.php/Color_Bash_Prompt
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################
bash_prompt_command() {
    # How many characters of the $PWD should be kept
    local pwdmaxlen=40
    # Indicate that there has been dir truncation
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}

bash_prompt() {
    local NONE="\[\033[0m\]"    # unsets color to term's fg color
    local ID_COLOR="\[\033[1;36m\]"
    local PWD_COLOR="\[\033[1;33m\]"
    local UC=$W                 # user's color
    [ $UID -eq "0" ] && UC=$R   # root's color

    PS1="\n${ID_COLOR}${UC}\h:${PWD_COLOR} \${NEW_PWD}${UC}${NONE}"
}

PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt

# Show current git branch at bash prompt:
# PS1='\u@\h \W$(__git_ps1 " (%s)")\$ '
PS1=$PS1'$(__git_ps1 " (%s)") \n→ '

# PS1 suggestions from https://wiki.archlinux.org/index.php/Color_Bash_Prompt:
#PS1='\e[1;33;47m\u \e[1;32;47mon \h \e[1;35;47m\d \@\e[0;0m\n\e[1;34m[dir.= \w] \# > \e[0;0m'
#PS1='\e[1;31;47m\u \e[1;32;47mon \h \e[1;35;47m\d \@\e[0;0m\n\e[1;31m[dir.= \w] \# > \e[0;0m'
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
export ANDROID_NDK_HOME=/usr/local/opt/android-ndk
# export ANDROID_HOME=/Applications/Android\ Studio.app/sdk
export ANDROID_HOME=$ANDROID_SDK_ROOT

PATH=$PATH:/usr/local/share/npm/bin
PATH=/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
PATH=$PATH:/Applications/Postgres.app/Contents/MacOS/bin
PATH=$PATH:$ANDROID_HOME/tools
PATH=$PATH:$ANDROID_HOME/platform-tools
PATH=$PATH:/opt/local/bin
PATH=$PATH:/opt/local/sbin
PATH=$PATH:/usr/local/mysql/bin
PATH=$PATH:/usr/local/git/bin
PATH=$PATH:/Applications/mongodb/bin
PATH=$PATH:/Developer/usr/bin
PATH=$PATH:$HOME/.nvm/versions/node/v8.11.0/bin # to enable sublimelinter finding eslint
PATH=$PATH:$GOPATH/bin
PATH=$PATH:$GOROOT/bin

# http://blog.macromates.com/2008/working-with-history-in-bash/
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=1000000
shopt -s histappend

# After each command, append to the history file and reread it. Preserves history across all terminal windows
# export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export NODE_ENV=development

export PATH

# {{{
# Node Completion - Auto-generated, do not touch.
# shopt -s progcomp
# for f in $(command ls ~/.node-completion); do
#   f="$HOME/.node-completion/$f"
#   test -f "$f" && . "$f"
# done
# }}}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Autocorrect on the command line
# shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done

# Import autujump indexing
# [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Switch to fish terminal. Do this rather than chsh so as to migrate exports
# Things that don't work with fish:
# - any aliases in .bash_profile (some have been migrated to .config/fish/config.fish)
# - rvm?
# - ssh?!
# fish

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

source ~/.nvm/nvm.sh
nvm alias default $(cat ~/.nvmrc)
# nvm use > /dev/null 2>&1 # expects ~/.nvmrc to define version

# added by Anaconda 2.1.0 installer
export PATH="$HOME/anaconda/bin:$PATH"

# http://yobeki.com/how-to-make-nvm-automatically-use-the-correct-version-of-nodejs-for-a-specific-project/
cd () { builtin cd "$@" && chNodeVersion; }
pushd () { builtin pushd "$@" && chNodeVersion; }
popd () { builtin popd "$@" && chNodeVersion; }

chNodeVersion() {
  # if there's a file named ".nvmrc"...
  if [ -f ".nvmrc" ] ; then
  # use it
  nvm use;
  fi
}

chNodeVersion;

# https://github.com/joshfng/slack-keep-presence
# [[ -z "${SLACK_TOKEN}" ]] && echo No SLACK_TOKEN provided, skipping presence beacon || slack-keep-presence &

# eval `ssh-agent`

tmuxref
