# devDesk

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash &&
source ~/.bashrc &&
sudo apt install -y git &&
cd ~/ &&
git clone https://github.com/Zdep88/devDesk.git &&
cd ~/devDesk/
echo &&
echo "bash :" &&
ls ~/devDesk/bash/ &&
echo &&
echo "desks :" &&
ls ~/devDesk/desks
```

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
