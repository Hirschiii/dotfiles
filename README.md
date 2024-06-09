# My Produktivity Enviroment

## How to use

Personally I would not recomend just copying others Dotfiles. Read them and
pick stuff you want. My workflow with this repo is using ''stow'' to
*"install"* the packages I want on my new system.

In this repo I do have full blown "working enviroments" for sway and hyprland
wich come with everything needed to get starting working. Besides of that I
have the configurations for different tools I use like alacritty, nvim, sc-im
or taskwarrior. Those wont be in the workenviroment but a package them self.

```
stow -d {workenviroment or package} {package name} -T $HOME/
```

##### Example:

If you want to install my nvim config you would cd into the folder of this repo (You can clone it where ever you want) and execute the following:

```
stow -d packages neovim -t $HOME
```

# Plans:

- [ ] Script to select wanted packages or enviroments
