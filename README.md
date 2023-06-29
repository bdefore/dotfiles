## Before

- [Install chezmoi](https://github.com/twpayne/chezmoi/blob/master/docs/INSTALL.md)
- Run `chezmoi init --apply bdefore`

## Setup

#### MacOS
```
(cd ./scripts/macos && ./setup)
```

#### Linux

NOTE: This has most recently been used, and is configured to be used, on Manjaro/Arch. If using Debian, edit `setup` first and change first line to `setup_debian` from `setup_arch`

```
chezmoi cd
(cd ./scripts/linux && ./setup)
(cd ./scripts/common && ./setup_ruby)
(cd ./scripts/common && ./setup_node)
(cd ./scripts/common && ./setup_npm_globals)

# optional: if you intend to develop directly on this machine
(cd ./scripts/linux && ./setup_arch_extended)

# optional: if you intent to work with audio/visual
(cd ./scripts/linux && ./setup_multimedia)

# optional: if you intend to consume
(cd ./scripts/linux && ./setup_entertainment)

yay

# optional: retrieve disk space from all the installs, currently 1.4GB
rm -rf .cache/

# if you are on manjaro sway, to immediately load my configuration of it:
Super + shift + c

# further steps on manjaro:
- Make UI dark: Open Apperance, change to Matcha-dark-sea
- Firefox: Turn on dark theme, add basic add-ons: uBlock Origin, Dark Reader, Bitwarden
- TODO: harden browser
```

#### Chrome OS

- Boot up, setup WiFi, install updates
- Change channel to beta or dev
    - Click bottom right area
    - Click settings cog
    - Click the hamburger
    - Scroll to bottom of pullout, About Chrome OS 
    - Detailed build information
    - Change channel to beta or dev
    - Wait for update to download
    - Restart
- Linux (Crostini)
    - Open settings again, find Linux (Beta), click Turn on, install
- Open Terminal
    - Follow install instructions above for Linux
- While waiting for setup scripts:
    - Add new SSH key to Github/Bitbucket
        - Should be copied to clipboard at start of script.
        - If not: `cat ~/.ssh/id_rsa.pub | xclip -sel clip`
    - Change display
        - Open settings again
        - Display
        - Bump two rungs down towards 'Tiny', seems about right for Pixelbook
    - Enable flags. Ones I have:
        - Native Client (for Moonlight)
        - Smooth Scrolling
        - Touchable App Context Menu
        - New system menu
        - New style notification
        - Load Android apps automatically
        - Touchable App Context Menu (not sure why, for larger ui ?)
        - Enable Sys-Internals (for memory profiling)
    - Go through Chrome extensions, Hide from Chrome Menu (wish these would save preference)
    - Install Moonlight for streaming games
        - Requires manual exension install and NaCL flag (https://github.com/moonlight-stream/moonlight-chrome/releases/tag/v0.9.0)

## Post-Installation

The SSH daemon is enabled by setup, but you'll still need to connect to it. The easiest way is to run from another client: `ssh-copy-id -i ~/.ssh/id_rsa.pub username@ip.address.of.new.machine` and enter the password you've set up for the new machine. If you're running ChromeOS, you can run this from Termina then select `id_rsa` as the identity in Secure Shell App.

For code-server use, you'll first want to run it to create a file at `~/.config/code-server/config.yaml` and then edit the values there to your liking and get the random password generated.
