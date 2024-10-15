# Amal's Dotfiles and Configurations

<img src="https://github.com/theamallalgi/dotfiles/blob/main/dependencies/intro.png?raw=true" title="" alt="intro" data-align="center">


## The Contents

- Vim configuration (neovim)

- Git Configuration

- Alacritty Configuration

- MPV Configuration

- Editor Configuration
  
  - VSCode
  
  - Sublime Text

- Game Save Files

- Userprofile files
  
  - Bash & Zsh Configuration
  
  - Starship Configuration


## The Setup

#### Nvim Requirements

* Neovim >= **0.9.0**
* Git >= **2.19.0** (for partial clones support
* a [Nerd Font](https://www.nerdfonts.com/) (v3.0 or greater)
  * Jetbrains Mono
  * Cartograph CF
* [lazygit](https://github.com/jesseduffield/lazygit)  **(optional)**
* a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
* for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) **(optional)**
  * **live grep**: [ripgrep](https://github.com/BurntSushi/ripgrep)
  * **find files**: [fd](https://github.com/sharkdp/fd)
* a terminal that support true color and undercurl:
  * [Alacritty](https://github.com/alacritty/alacritty)  **(Linux, Macos & Windows)**
  * [Windows Terminal](https://github.com/microsoft/terminal)  **(Linux, Macos & Windows)**
- [Aura Theme](https://github.com/daltonmenezes/aura-theme/)  **- Dark Theme (optional)**

#### Shell/Terminal Setup

- Alacritty **(The best terminal emulator there is!)**

- Bash & Zsh **(Yes, I step on two boats at the same time!)**

- Nerd Font **(Jetbrains Mono Nerd font Patch)**

- zoxide **(Directory Jumper)**

- Fuzzy Finder **(fzf, you know what it does!)**

- Scoop **(Better than Homebrew imo!)**

- Oh my Posh **(Command Line Client)**


### The Screenshots

<img title="" src="https://github.com/theamallalgi/dotfiles/blob/main/dependencies/alacritty.png?raw=true" alt="alacritty" data-align="center">

<img src="https://github.com/theamallalgi/dotfiles/blob/main/dependencies/mpv%20idle.png?raw=true" title="" alt="mpv idle" data-align="center">

<img src="https://github.com/theamallalgi/dotfiles/blob/main/dependencies/mpv%20osd.png?raw=true" title="" alt="mpv osd" data-align="center">

<img src="https://github.com/theamallalgi/dotfiles/blob/main/dependencies/mpv%20idle%20s.png?raw=true" title="" alt="mpv idle s" data-align="center">

<img src="https://github.com/theamallalgi/dotfiles/blob/main/dependencies/nvim%20a.png?raw=true" title="" alt="nvim a" data-align="center">

<img src="https://github.com/theamallalgi/dotfiles/blob/main/dependencies/nvim%20b.png?raw=true" title="" alt="nvim b" data-align="center">

<img title="" src="https://github.com/theamallalgi/dotfiles/blob/main/dependencies/nvim%20c.png?raw=true" alt="nvim c" data-align="center">


## The Usage

Follow these steps to setup the script

- Add the files and directories you want to back up to the `FILES_TO_COPY` array in `update.sh`.
- Ensure the script has execution permissions: `chmod +x dotfile_backup.sh`.
- click `ctrl+r` and type in `shell:startup` copy the shortcut of the shell script or setup a file to execute the file in the startup folder.
