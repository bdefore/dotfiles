
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# # https://wiki.archlinux.org/index.php/SSH_keys#SSH_agents
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent > ~/.ssh-agent-thing
# fi
# if [[ "$SSH_AGENT_PID" == "" ]]; then
#     eval "$(<~/.ssh-agent-thing)"
# fi
