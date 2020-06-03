# dotfiles

```sh
# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew bundle

# bash
sudo bash -c 'echo "/usr/local/bin/bash" >> /etc/shells'
chsh -s /usr/local/bin/bash
sudo chsh -s /usr/local/bin/bash

# pip
pip install -r requirements.txt --user
```
