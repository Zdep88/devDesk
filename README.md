# devDesk

## New desk

```sh
read -p "Enter your full name : " name &&
read -p "Enter your email : " email &&
sudo apt update &&
sudo apt upgrade -y &&

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash &&
source ~/.bashrc &&
nvm install --lts &&
nvm use --lts &&
npm install -g npm@latest &&

sudo apt install -y git &&
git config --global user.name "$name" &&
git config --global user.email "$email" &&

sudo apt install -y nginx &&
sudo sed -i 's/^[[:space:]]*#[[:space:]]*server_names_hash_bucket_size/        server_names_hash_bucket_size/' /etc/nginx/nginx.conf &&
sudo rm /etc/nginx/sites-enabled/default &&
sudo nginx -t &&
sudo systemctl restart nginx &&

ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519 -N "" &&
eval "$(ssh-agent -s)" &&
ssh-add ~/.ssh/id_ed25519 &&
key=$(cat ~/.ssh/id_ed25519.pub) &&
echo &&
echo "Public SSH key :" &&
echo "$key"
```

## purge


## New hosted static

```sh
read -p "New site URL : " site_url &&
read -p "Git ssh url : " git_url &&
git_name=$(basename "$git_url" .git) &&

mkdir ~/code
cd ~/code &&
git clone "$git_url" &&

sudo mkdir /var/www/$site_url &&
sudo cp -r ~/code/$git_name/* /var/www/$site_url &&

sudo touch /etc/nginx/sites-available/$site_url &&
sudo tee /etc/nginx/sites-available/$site_url > /dev/null <<EOF
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
sudo ln -s /etc/nginx/sites-available/$site_url /etc/nginx/sites-enabled/ &&
sudo nginx -t &&
sudo systemctl restart nginx
```

## Dynamic server bloc

server {
        listen 80;
        listen [::]:80;
        server_name $site_url;
        
        location / {
                proxy_pass http://localhost:3000;
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
