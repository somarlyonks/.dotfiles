# zsh

## Plugins

Oh-my-zsh

[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)

`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

## Theme

A modified minimalist [arrow.zsh-theme](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/arrow.zsh-theme) original from [oh-my-zsh](http://ohmyz.sh/).

## Cheatsheet

### cli shortcuts

alt + w: delete all  
ctrl + w: delete word  
ctrl + a: line start  
ctrl + d: EOF  

### git shortcuts

| Alias | command |
|:---- |:--------------------------------|
| g    | git |
| ga   | git add |
| gc   | git commit -v |
| gc!  | git commit -v --amend |
| gca  | git commit -va |
| gca! | git commit -va --amend |
| gcm  | git checkout master |
| gco  | git checkout |
| ggl  | git pull origin $(current_branch) |
| gl   | git pull |
| glum | git pull upstream master |
| ggp  | git push origin $(current_branch) |
| gp   | git push |
| gr   | git remote |
| grv  | git remote -v |
| grb  | git rebase |
| grbm | git rebase master |
| grba | git rebase --abort |
| grbc | git rebase --continue |
| gss  | git status -s |
| gst  | git status |

## Customization

https://github.com/robbyrussell/oh-my-zsh/wiki/Customization

## WSL only

### xdg-open

```bash
export BROWSER="/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe"
```

In file `/usr/bin/sensible-browser`, update line that reads `${BROWSER} "$1"` to `"${BROWSER}" "$1"`
