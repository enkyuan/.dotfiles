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
