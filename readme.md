Just my dotfiles.

---

Matt, you always forget what to do when you get a new laptop. Here just copy and paste this.

```bash
mkdir src
cd src
git clone git@github.com:mastermatt/myenv.git
cd myenv
make install

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

brew bundle
source ~/.zshrc

# remove everything from the dock
defaults write com.apple.dock persistent-apps -array
killall Dock
```

##### Set iTerm profile

- Preferences > Profiles > select "Matt's Primary" > Other Actions > Set as default

##### Create gpg key and add to GitHub

[GitHub Docs](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

If you get permission issues with `/Users/matt/.gnupg`:

```bash
sudo chown -R $USER ~/.gnupg
chmod 700 ~/.gnupg
```
