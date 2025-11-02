# dotfiles loadout

## Requirements
- OS: Ubuntu
- DE: Gnome
> Compatibility with other distros or DEs is not guaranteed and may result in unexpected behavior.


## features
- no sudo privileges required.

## What it does
- gnome settings config, makes gnome less-annoying
- vscode settings.json config + extensions
- firefox config:
   - using [arkenfox](https://github.com/arkenfox/user.js) user.js
   - and a custom [userChrome.css](https://github.com/datguypiko/Firefox-Mod-Blur) **using the `css` flag**
- gnome-terminal config
- vim config
- bash config
- neovim config:
   - loads [lazyvim](https://www.lazyvim.org/) with additional plugins


## How to Apply
1.
```bash
(Clone the repo)
```

2.
```bash
sh loadout/loadout.bash
```
Or (with custom firefox css)
```bash
sh loadout/loadout.bash css
```
