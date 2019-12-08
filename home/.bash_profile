# mac
PATH=$PATH:/Applications/mongodb/bin
PATH=$PATH:/Developer/usr/bin
PATH=$PATH:/Applications/Postgres.app/Contents/MacOS/bin

# linux
PATH=$PATH:/usr/local/share/npm/bin
PATH=/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
PATH=$PATH:/opt/local/bin
PATH=$PATH:/opt/local/sbin
PATH=$PATH:/usr/local/mysql/bin
PATH=$PATH:/usr/local/git/bin

export PATH

# [[ -r ~/.profile ]] && source ~/.profile
[[ -r ~/.bashrc ]] && source ~/.bashrc

[[ -r ~/.corporate_profiles/bcdef ]] && source ~/.corporate_profiles/bcdef

# Default editor for those that check this property i.e. git for commit messages
# export EDITOR='subl'
export EDITOR='code -w'

# Switch to fish terminal. Do this rather than chsh so as to migrate exports
# Things that don't work with fish:
# - any aliases in .bash_profile (some have been migrated to .config/fish/config.fish)
# - rvm?
# - ssh?!
# fish

# https://github.com/joshfng/slack-keep-presence
# [[ -z "${SLACK_TOKEN}" ]] && echo No SLACK_TOKEN provided, skipping presence beacon || slack-keep-presence &

# eval `ssh-agent`

# if in tmux, load pre config with customizations to theme, see .tmux.conf for more info
[[ -v TMUX ]] && echo Loading tmux configurations... && tmux source "$HOME/.tmux-pre.conf" && tmux source "$HOME/.tmux.conf" && echo tmux configuration complete, remember to prefix-I if first run to install plugins
