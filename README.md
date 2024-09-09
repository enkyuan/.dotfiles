# osx dotfiles

## installation
```bash
# brew & chezmoi need to be installed prior to these instructions - need to edit the brewfile

# installing dotfiles repo - configure git globally first
chezmoi init --apply https://github.com/enkyuan/.dotfiles.git

# alternate method using GitHub
chezmoi init --apply enkyuan

# installing brew packages
chmod +x brew_pkgs.sh
./brew_pkgs.sh
```

## sidenote(s)

when installing lem, make sure to follow the instructions highlighted in these docs:

https://lem-project.github.io/installation/sdl2/macos/

i need to find a way to automate this process but this is for later

the clang-tidy executable file was removed from the folder for vscode extensions due to the file size--this is for future reference in case something breaks

there is a warning with generic api keys exposed for vscode extensions and some other directories--note this if the .vscode directory has issues with installation

when updating ruby, make sure to follow the instructions highlighted in these docs:

https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-macos
