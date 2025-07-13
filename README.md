# devDesk

## New desk

```sh
echo
read -p "Enter your full name : " name
read -p "Enter your email : " email
sudo apt update &&
sudo apt upgrade -y &&
sudo apt install -y git &&
git config --global user.name "$name" &&
git config --global user.email "$email" &&
ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519 -N "" &&
eval "$(ssh-agent -s)" &&
ssh-add ~/.ssh/id_ed25519 &&
key=$(cat ~/.ssh/id_ed25519.pub)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash &&
source ~/.bashrc &&
nvm install --lts &&
nvm use --lts &&
npm install -g npm@latest &&
echo
echo "Public SSH key :"
echo "$key"
```

## Bash

[Git + SSH](https://github.com/Zdep88/devDesk/blob/main/git_ssh.sh)

[Install & Setup Git](https://github.com/Zdep88/devDesk/blob/main/git.sh)

[Install & Setup NginX](https://github.com/Zdep88/devDesk/blob/main/nginx.sh)

[Install Node, NPM, NVM](https://github.com/Zdep88/devDesk/blob/main/node.sh)

[Create SSH Keys](https://github.com/Zdep88/devDesk/blob/main/ssh.sh)

[Create Sudo User](https://github.com/Zdep88/devDesk/blob/main/sudoer.sh)

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
