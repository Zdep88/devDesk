# devDesk

```sh
sudo apt update &&
sudo apt upgrade -y &&
sudo apt install -y git &&
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash &&
source ~/.bashrc &&
nvm install --lts &&
nvm use --lts &&
npm install -g npm@latest &&
cd ~/
git clone https://github.com/Zdep88/devDesk.git
cd devDesk
npm start
```

## New site

```sh
read -p "Git ssh url : " git_url &&
read -p "New site URL : " site_url &&
git_name=$(basename "$git_url" .git) &&
mkdir ~/code &&
cd ~/code &&
git clone "$git_url" &&
sudo touch /etc/nginx/sites-available/$site_url &&
while true; do
    read -p "Choose between type 'static' or 'dynamic' : " site_type
    if [ "$site_type" = "static" ] || [ "$site_type" = "dynamic" ]; then
        break
    fi
done
if [ "$site_type" = "static" ]; then
    sudo mkdir /var/www/$site_url &&
    sudo cp -r ~/code/$git_name/* /var/www/$site_url &&
    sudo tee /etc/nginx/sites-available/$site_url >/dev/null <<EOF
server {
        listen 80;
        listen [::]:80;
        root /var/www/$site_url;
        index index.html;
        server_name $site_url;
        location / {
                try_files \$uri \$uri/ =404;
        }
}
EOF
else
    echo "Ports already used :" &&
    grep -h "proxy_pass.*localhost:" /etc/nginx/sites-enabled/* 2>/dev/null | grep -o "localhost:[0-9]\+" | cut -d: -f2 | sort -n | uniq &&
    read -p "Application port : " app_port &&
 
    sudo touch /etc/nginx/sites-available/$site_url &&
    sudo tee /etc/nginx/sites-available/$site_url >/dev/null <<EOF
server {
        listen 80;
        listen [::]:80;
        server_name $site_url;
        
        location / {
                proxy_pass http://localhost:$app_port;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
                proxy_cache_bypass $http_upgrade;
        }
}
EOF
fi
sudo ln -s /etc/nginx/sites-available/$site_url /etc/nginx/sites-enabled/ &&
sudo nginx -t &&
sudo systemctl restart nginx &&
sudo certbot --nginx &&
if [ "$site_type" = "dynamic" ]; then
    tmux new -s $git_name
fi
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
