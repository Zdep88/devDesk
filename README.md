# devDesk

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash &&
sudo apt install -y git &&
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
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
