# powershell

## locate/init PROFILE

```ps1
if (!(Test-Path -Path $PROFILE)) { New-Item -Path $PROFILE -ItemType File }; ise $PROFILE
```

## modules

```ps1
Install-Module Get-ChildItemColor -Scope CurrentUser
```
