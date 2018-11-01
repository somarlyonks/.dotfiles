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

### tested environment:

  Manjaro 17.1.12

  x86_64 kernel 4.14.67-1

  flatpak v1.0.1

  vscode v1.27.1

### found problems

There appears a readline problem and backspace/left/right .etc may not work as expected in zsh but work in bash.
