### Installation

## MacOS
```
git clone https://github.com/bdefore/dotfiles && cd dotfiles && ./.setup_osx
```
## Chrome OS

- Boot up, setup WiFi, install updates
- Change channel to dev
    - Click bottom right area
    - Click settings cog
    - Click the hamburger
    - Scroll to bottom of pullout, About Chrome OS 
    - Detailed build information
    - Change channel to dev
    - Wait for update to download
    - Restart
- Linux (Crostini)
    - Open settings again, find Linux (Beta), click Turn on, install

```
git clone https://github.com/bdefore/dotfiles && cd dotfiles && ./.setup_linux
```

- While waiting for setup scripts:
    - Add new SSH key to Github/Bitbucket
        - Should be copied to clipboard at start of script.
        - If not: `cat ~/.ssh/id_rsa.pub | pbcopy`
    - Change display
        - Open settings again
        - Display
        - Bump two rungs down towards 'Tiny', seems about right for Pixelbook
