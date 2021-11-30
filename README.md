### Overview

* `[dotbot]()` Manages dotfiles and installs in a reproducible way, its
  configuration file can be found in `install.conf.yaml`
* `[dotbot-brewfile](https://github.com/sobolevn/dotbot-brewfile)` Interfaces
  with `brew bundle` during the dotbot installation phase

### Font

I am using OperatorMono as my development font. Specifically using the
OperatorMono italic font for nvim comments as well as in Alacritty.

OperatorMono is a paid font, I suggest you support the font creators.

In order for OperatorMonoItalic to work in Alacritty and Neovim, you'll have to
follow [these steps](https://github.com/alacritty/alacritty/issues/489#issuecomment-288074579).

Create a new file called `xterm-256color-italic.terminfo` in `$HOME` with the
following contents:

```
xterm-256color-italic|xterm with 256 colors and italic,
sitm=\E[3m, ritm=\E[23m,
use=xterm-256color,
```

1. Compile it, with command: `tic xterm-256color-italic.terminfo`
2. Set it as the TERM within `alacritty.yml`
3. Restart alacritty. test with command: echo -e "\e[3mfoo\e[23m". It should
   output foo in italics.

```yaml
env:
  # TERM variable
  #
  # This value is used to set the `$TERM` environment variable for
  # each instance of Alacritty. If it is not present, alacritty will
  # check the local terminfo database and use 'alacritty' if it is
  # available, otherwise 'xterm-256color' is used.
  #
  # CUSTOM
  # Decided to use OperatorMono in neovim and terminal.
  # Made a custom xterm color scheme to set the italics font
  #
  # Source: https://github.com/jwilm/alacritty/issues/489#issuecomment-288074578
  #
  # Compiled with `tic xterm-256color-italic.terminfo`
  TERM: xterm-256color-italic

font:
  normal:
    family: Operator Mono Nerd Font
    style: Book
  bold:
    family: Operator Mono Nerd Font
    style: Medium
  italic:
    family: Operator Mono Nerd Font
    style: Book Italic
```

Now we need to move to our tmux config so that tmux will pickup and understand
our new `TERM` and font settings

```tmux
# enable true color support and italics
set -g default-terminal "xterm-256color-italic"
set -ga terminal-overrides ",xterm-256color-italic:Tc"
```

Then we need to restart tmux

