### Installation

## MacOS
```
(cd ./scripts/macos && ./setup)
```
## Linux (tested on Debian, Ubuntu, Gallium)
```
./scripts/linux/setup
./scripts/linux/setup_development_tools # optional, only do this if you intend to work directly on this machine
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
