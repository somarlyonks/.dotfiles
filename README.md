# .dotfiles

sy

## Fonts

- ~~[powerline/fonts](https://github.com/powerline/fonts): DejaVu Sans Mono for Powerline Regular.~~(depreated)
- [CamingoCode](https://www.fontsquirrel.com/fonts/camingocode): CamingoCode font for VSCode.

test texts: 1il7L uvw wW gpq9 2Zz 5Ss oO08 nnmrn dc|cb|o

## Usage

Make sure in `bash` and have `zsh` && `oh-my-zsh` installed.

### clone

```bash
git clone git@github.com:somarlyonks/.dotfiles.git ~/.dotfiles
```

### checkout to a new branch

```bash
cd ~/.dotfiles && gco -b sy-ENVY
```

### link

```bash
chmod +x ./utils.py && ./utils.py
```

This appends things like `source "$HOME/.dotfiles/zsh/.zshrc"` to the end of corresponding files or backup the present config file and replace it with new content in this repo.

Since then you can change configs both locally at `~/.zshrc` or `~/.dotfiles/zsh/.zshrc` where you can keep the changes you want to track.
