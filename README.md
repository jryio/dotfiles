##.📄s

Hey, look, `.dotfiles`!

These are dot files for iTerm, vim, ohmyzsh, zsh, and vundle.

### Using
To get these dotfiles in the correct location do the following:

```bash
git clone https://github.com/thebearjew/dotfiles.git ~/.dotifles
cd ~/.dotfiles
```

Now run the `install.sh` Bash script which will will get all dependencies install on your system: **OS X**, **Ubuntu**, or **ArcLinux**.

```bash
chmod +x install.sh			# Making our install script executable on the user level
./install.sh
```

You might run into some errors if you already have some of the packages installed (vim, git, etc.) but you can simply `brew unlink <package-name>` then run again, or edit the list of packages to install in the `install.sh` file.

### Extra Setup
To get iTerm working with settings and themes, go to Preferences > Load preferences from custom folder or URL > `~/.dotfiles/iterm-prefs`. Relaunch iTerm and the theme/settings will be applied.


### Forking

For the living shit out of dotfiles, that's why they're here! Would love some improvements/suggestions for the `install.sh`

:v:


