# my config files..
install.sh uses ln_dir2dir.py to link:
```
* homedir/*   -> ~/
* configdir/* -> ~/.config/
```
and downloads vim package managers..

# system config things
* all the shortcuts:
  * super + t - terminal
  * super + l - lock screen
  * super + q - close window
  * super + f - maximize
  * super + d - show desktop

* ksuperkey to make super key work for whisker menu... remap alt + f1 ? to whisker menu
* https://wiki.archlinux.org/title/XDG_user_directories

# flatpak
I have a flatpak thingie which will open flathub links with flatpak install in xfce4-terminal (requires flatline browser addon)

just install them by hand if necessary:
1. move scripts to /usr/bin/ and .desktop to ~/.local/share/applications (or somewhere else and change paths)
2. run `xdg-mime default appstream-uri-handler.desktop x-scheme-handler/appstream`
