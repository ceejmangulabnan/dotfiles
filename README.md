# Dotfiles
TODO: script to stow all directories with one command.

## Dependencies
- stow
- git
- kanata
- neovim

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

## Kanata 
- Download kanata 
```bash
sudo paru -S kanata-bin
```

Config files for kanata will be placed in /etc/ for system-wide access
```bash
stow -v -t /etc/ kanata
```


Copy kanata.service file to `/etc/systemd/system`
```bash
sudo cp ~/kanata/kanata.service /etc/systemd/system/ && sudo cp ~/kanata/kanata.kbd /etc/kanata
```

Start the service
```bash
sudo systemctl start kanata
sudo systemctl enable kanata
```

Verify the service is running
```bash
sudo systemctl status kanata
```

Reference links:
[https://github.com/jtroo/kanata/discussions/130#discussioncomment-8518832
](https://github.com/jtroo/kanata/discussions/130#discussioncomment-8518832)


