# Dotfiles
TODO: script to stow all directories with one command.

## Dependencies
- stow
- git

## Installation
Clone the repo into your home directory.

```bash
git clone git@github.com:ceejmangulabnan/dotfiles.git
```


or

```bash
git clone https://github.com/ceejmangulabnan/dotfiles.git
```

## Creating symlinks
The config files are grouped into applications and designed to be stowed modularly instead of having it mimic the structure of the home directory.

To create symlinks to your home directory for each app, run the command:
```bash
stow -v -t ~ <app_name>
```
Example command for nvim:
```bash
stow -v -t ~ nvim
```
