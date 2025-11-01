# Dotfiles
TODO: script to stow all directories with one command.

## Dependencies
- stow
- git

## Installation
Clone the repo into your home directory.
$ git clone git@github.com:ceejmangulabnan/dotfiles.git

or

$ git clone https://github.com/ceejmangulabnan/dotfiles.git

## Creating symlinks
The config files are grouped into applications and designed to be stowed modularly instead of having it mimic the structure of the home directory.

To create symlinks to your home directory for each app, run the command:
$ stow -v -t ~ <app_name>

Example command for nvim:
$ stow -v -t ~ nvim
