# VS Code

## Theme

- Dark
  - Palenight
  - One Monokai
- Light
  - Light+ Tweaked
- Icon
  - vscode-icons

## Font

[CamingoCode](https://www.fontsquirrel.com/fonts/camingocode)

## [Extensions](./extensions)

- GitLens
- TODO Highlight
- Bracket Pair Colorizer

## Environments

If VSCode is running in flatpak, it recommanded to upgrade flatpak to v1.0.0+ which has better support for portals with a new tool called `flatpak-spawn`.

Run VSCode in host with commands like

```bash
flatpak run --talk-name=org.freedesktop.Flatpak com.visualstudio.code
```

Or it's a good practice to alias it with `code`.

Start the integrated terminal, create a script in the sandbox with

```bash
echo "exec flatpak-spawn --host zsh" > ~/zsh-spawn.sh
```

Then link it to an executable file

```bash

ln -s ~/zsh-spawn.sh ~/zsh-spawn
chmod u+x ~/zsh-spawn
```

And in VSCode, edit the setting `terminal.integrated.shell.linux` to `/home/<username>/zsh-spawn`. Then, the integrated terminal will work just like native konsole /gnome-terminal.

These worked fine in Manjaro17 + flatpak v1.0.1 + vscode v1.27.1
