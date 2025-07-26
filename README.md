# devDesk

## sudoer

```sh
echo &&
read -p "Enter username: " username &&
sudo adduser "$username" &&
sudo usermod -aG sudo "$username"
```

## new desk

```sh
echo &&
while true; do
    read -p "(d)ev or (s)erv ? : " desktype &&
    case $desktype in
        d|dev)
            read -p "Enter your full name : " name &&
            break
        ;;
        s|serv)
            break
        ;;
    esac
done
read -p "Enter your email : " email &&
ssh-keygen -t ed25519 -C "$email" -f /home/$USER/.ssh/id_ed25519 -N "" &&
eval "$(ssh-agent -s)" &&
ssh-add /home/$USER/.ssh/id_ed25519 &&
key=$(cat /home/$USER/.ssh/id_ed25519.pub) &&
echo &&
echo "$key" &&
read -p "Copy SSH key, then press any key to continue." -n 1 -s &&
echo &&
sudo apt update &&
sudo apt upgrade -y &&
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash &&
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install --lts &&
nvm use --lts &&
npm install -g npm@latest &&
sudo apt install -y git &&
cd /home/$USER/ &&
git clone git@github.com:Zdep88/devDesk.git &&
case $desktype in
    d|dev)
        git config --global user.name "$name" &&
        git config --global user.email "$email" &&
        cd /home/$USER/devDesk &&
        code . &&
        exit
    ;;
    s|serv)
        sudo apt install -y nginx &&
        sudo sed -i 's/^[[:space:]]*#[[:space:]]*server_names_hash_bucket_size/        server_names_hash_bucket_size/' /etc/nginx/nginx.conf &&
        sudo rm /etc/nginx/sites-enabled/default &&
        sudo nginx -t &&
        sudo systemctl restart nginx &&
        sudo apt install -y snapd &&
        sudo snap install --classic certbot &&
        sudo ln -s /snap/bin/certbot /usr/bin/certbot &&
        npm install pm2@latest -g &&
        pm2 update &&
        sudo cp /home/$USER/devDesk/ecosystem.txt /home/$USER/ecosystem.config.js &&
        pm2 startup
        sudo env PATH=$PATH:~/.nvm/versions/node/v22.17.1/bin ~/.nvm/versions/node/v22.17.1/lib/node_modules/pm2/bin/pm2 startup systemd -u $USER --hp /home/$USER &&
        echo &&
        echo "Type this command to host a new site :" &&
        echo "sh ~/devDesk/newSite.sh" &&
        echo
    ;;
esac
```
