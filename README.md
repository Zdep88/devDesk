# devDesk

## New desk

```sh
sudo apt update &&
sudo apt upgrade -y &&
sudo apt install -y git &&
cd ~ &&
git clone https://github.com/Zdep88/devDesk.git &&
sh ~/devDesk/newDesk.sh
```

## Bash

[Create Sudo User](https://github.com/Zdep88/devDesk/blob/main/sudoer.sh)

[Create SSH Keys](https://github.com/Zdep88/devDesk/blob/main/ssh.sh)

[Install & Setup Git](https://github.com/Zdep88/devDesk/blob/main/git.sh)

[Install Node, NPM, NVM](https://github.com/Zdep88/devDesk/blob/main/node.sh)

[Install & Setup NginX](https://github.com/Zdep88/devDesk/blob/main/nginx.sh)

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