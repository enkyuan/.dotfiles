# personal setup

## installation
```bash
# installing dotfiles repo
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

> the clang-tidy executable file was removed from the folder for vscode extensions due to the file size--this is for future reference in case something breaks

some notes on the .vscode directory:

> warning--generic api keys exposed for vscode extensions and some other directories (this if the .vscode dir has issues with installation)

when updating ruby, make sure to follow the instructions highlighted in these docs:

https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-macos

complete zathura installation using the following documentation:

https://github.com/zegervdv/homebrew-zathura
