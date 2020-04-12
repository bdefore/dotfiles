[[ -r ~/.bash ]] && source ~/.bash
[[ -r ~/.alias ]] && source ~/.alias
[[ -r ~/.prompt ]] && source ~/.prompt
[[ -r ~/.node ]] && source ~/.node
[[ -r ~/.ruby ]] && source ~/.ruby
[[ -r ~/.go ]] && source ~/.go
[[ -r ~/.Xmodmap ]] && xmodmap ~/.Xmodmap # TODO: what was this for? galliumos?

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# # https://wiki.archlinux.org/index.php/SSH_keys#SSH_agents
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent > ~/.ssh-agent-thing
# fi
# if [[ "$SSH_AGENT_PID" == "" ]]; then
#     eval "$(<~/.ssh-agent-thing)"
# fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/d4/.sdkman"
[[ -s "/home/d4/.sdkman/bin/sdkman-init.sh" ]] && source "/home/d4/.sdkman/bin/sdkman-init.sh"
