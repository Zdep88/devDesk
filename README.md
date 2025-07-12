# devDesk

## New desk

```sh
echo ""
read -p "Enter your full name : " name
read -p "Enter your email : " email

sudo apt update
sudo apt upgrade -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.bashrc

nvm install --lts
nvm use --lts
npm install -g npm@latest
sudo apt install -y git
git config --global user.name "$name"
git config --global user.email "$email"

ssh-keygen -t ed25519 -C "$email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
printf "\nPublic SSH key :\n"
cat ~/.ssh/id_ed25519.pub
```

## Bash

[Create Sudo User](https://github.com/Zdep88/devDesk/blob/main/bash/createSudoer.sh)

[Create SSH Keys](https://github.com/Zdep88/devDesk/blob/main/bash/createSshKeys.sh)

[Install & Setup Git](https://github.com/Zdep88/devDesk/blob/main/bash/installAndSetupGit.sh)

[Install Node, NPM, NVM](https://github.com/Zdep88/devDesk/blob/main/bash/installNodeNpmNvm.sh)

## Tmux

|linux||
|-|-|
| tmux ls  | Display opened sessions |
| tmux new -s <Name> | Start new session |
| tmux a -t <Name> | Attach to session |
| tmux kill-session -t <Name> | Kill session |

|tmux||
|-------------|-------------|
| CTRL + B, D | Leave session |
| CTRL + B, S | Display opened sessions |