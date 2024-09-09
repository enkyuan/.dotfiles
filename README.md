# osx dotfiles

## installation
```bash
# installing dotfiles repo - configure git globally first
chezmoi init --apply https://github.com/$GITHUB_USERNAME/.dotfiles.git

# alternate method using GitHub
chezmoi init --apply $GITHUB_USERNAME

# installing brew packages
chmod +x brew_pkgs.sh
./brew_pkgs.sh
```

## sidenote(s)

when installing lem, make sure to follow the instructions highlighted in the docs:

https://lem-project.github.io/installation/sdl2/macos/

i need to find a way to automate this process but this is for later
