# VS Code

## Theme

- Dark
  - syme
- Light
  - Light+ Tweaked
- Icon
  - vscode-icons

## Font

[CamingoCode](https://www.fontsquirrel.com/fonts/camingocode) for JS/TS

[FiraCode](https://github.com/tonsky/FiraCode) for functional PLs like Haskell/OCaml/Idris

## [Extensions](./extensions)

- GitLens
- Power Mode
- TODO Highlight
- Bracket Pair Colorizer

## Environments

### Manjaro (Arch)

If VSCode is running in flatpak, it's recommanded to upgrade flatpak to v1+ which has better support for portals with a new tool called `flatpak-spawn`.

Run VSCode in host with commands like

```bash
flatpak run --talk-name=org.freedesktop.Flatpak com.visualstudio.code
```

Or it's a good practice to alias it with `code`.

```bash
echo "alias code=\"flatpak run --talk-name=org.freedesktop.Flatpak com.visualstudio.code\"" | tee -a ~/.zshrc
source ~/.zshrc
```

Create a script under home directory with

```bash
echo "exec flatpak-spawn --host zsh" > ~/.zsh_spawn.sh
```

Then link it to an executable file

```bash

ln -s ~/zsh-spawn.sh ~/.zsh_spawn
chmod u+x ~/.zsh_spawn
```

And in VSCode, edit the setting `terminal.integrated.shell.linux` to `/home/<username>/.zsh_spawn`. Then, the integrated terminal will work just like native konsole/gnome-terminal.

### Windows (10)

To run git in wsl instead of git for Windows.

@see gist [git.wsl](https://gist.github.com/somarlyonks/f0f81644b59271473c14dfc2d226c8cc)
