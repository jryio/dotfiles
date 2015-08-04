## JYDotfiles 🎲

### makesymlinks.sh

The `makesymlinks.sh` [file](https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh) comes from Michael Smalley's [repo](https://github.com/michaeljsmalley/dotfiles/). 

In order to apply the dotifles in this repository execute `./makesymlinks.sh` in the `~/dotfiles` directory.

Quoting from Michael Smalley:

> The install script will:

> 1. Back up any existing dotfiles in your home directory to `~/dotfiles_old/`
> 2. Create symlinks to the dotfiles in `~/dotfiles/` in your home directory
> 3. Clone the `oh-my-zsh` repository from my GitHub (for use with `zsh`)
> 4. Check to see if `zsh` is installed, if it isn't, try to install it.
> 5. If zsh is installed, run a `chsh -s` to set it as the default shell.


Zsh is the preferred shell when cloning these dotfiles to anotehr machine. [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) will be cloned it does not currently exist in the `~/dotfiles` directory.

