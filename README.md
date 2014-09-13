Installation
--------------

### Generate a new ssh key for the machine
```
ssh-keygen -t rsa -C "bdefore@gmail.com"
ssh-add ~/.ssh/id_rsa
```

### Signup or log into github, add new machine's ssh key
```
pbcopy < ~/.ssh/id_rsa.pub
open https://github.com/settings/ssh
```

### Run .setup
```
curl https://github.com/bdefore/dotfiles/.setup | sudo sh 
```
