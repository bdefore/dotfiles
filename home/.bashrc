
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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/bdefore/.nvm/versions/node/v8.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /home/bdefore/.nvm/versions/node/v8.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/bdefore/.nvm/versions/node/v8.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /home/bdefore/.nvm/versions/node/v8.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
