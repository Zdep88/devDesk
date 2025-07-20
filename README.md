# devDesk

## sudoer

```sh
read -p "Enter username: " username &&
sudo adduser "$username" &&
sudo usermod -aG sudo "$username"
```

## new desk

```sh
while true; do
    read -p "(d)ev or (s)erv ? : " desktype
    case $desktype in
        d|dev)
            read -p "Enter your full name : " name
            break
        ;;
        s|serv)
            break
        ;;
    esac
done
read -p "Enter your email : " email &&
ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519 -N "" &&
eval "$(ssh-agent -s)" &&
ssh-add ~/.ssh/id_ed25519 &&
key=$(cat ~/.ssh/id_ed25519.pub) &&
echo &&
echo "$key" &&
read -p "Copy SSH key, then press any key to continue." -n 1 -s &&
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
cd ~/ &&
git clone git@github.com:Zdep88/devDesk.git
case $desktype in
    d|dev)
        git config --global user.name "$name" &&
        git config --global user.email "$email" &&
        cd ~/devDesk &&
        code .
    ;;
    s|serv)
        sudo apt install -y nginx &&
        sudo sed -i 's/^[[:space:]]*#[[:space:]]*server_names_hash_bucket_size/        server_names_hash_bucket_size/' /etc/nginx/nginx.conf &&
        sudo rm /etc/nginx/sites-enabled/default &&
        sudo nginx -t &&
        sudo systemctl restart nginx
        sudo apt install -y snapd &&
        sudo snap install --classic certbot &&
        sudo ln -s /snap/bin/certbot /usr/bin/certbot
    ;;
esac
```

## new site

```sh
read -p "Git ssh url : " giturl
read -p "New domain : " domain
gitname=$(basename $giturl .git) &&
while true; do
    read -p "Site type ? (s)tatic, (d)ynamic, (c)ustom " sitetype
    case $sitetype in
        s|static)
            break
            ;;
        d|dynamic)
            break
            ;;
        c|custom)
            break
            ;;
    esac
done
case $sitetype in
    s|static)
        sudo cp ~/devDesk/templates/static_server_bloc.txt /etc/nginx/sites-available/$domain &&
        sudo sed -i "s/example\.com/${domain}/g" /etc/nginx/sites-available/$domain
        ;;
    d|dynamic)
        sudo cp ~/devDesk/templates/dynamic_server_bloc.txt /etc/nginx/sites-available/$domain &&
        sudo sed -i "s/example\.com/${domain}/g" /etc/nginx/sites-available/$domain &&
        echo "Ports already used :" &&
        grep -h "proxy_pass.*localhost:" /etc/nginx/sites-enabled/* 2>/dev/null | grep -o "localhost:[0-9]\+" | cut -d: -f2 | sort -n | uniq &&
        read -p "Application port : " port &&
        sudo sed -i "s/PORT/${port}/g" /etc/nginx/sites-available/$domain
        ;;
    c|custom)
        sudo cp ~/devDesk/templates/custom_server_bloc.txt /etc/nginx/sites-available/$domain &&
        sudo sed -i "s/example\.com/${domain}/g" /etc/nginx/sites-available/$domain &&
        sudo nano /etc/nginx/sites-available/$domain
        ;;
esac
sudo mkdir /var/www/$domain &&
sudo ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/ &&
sudo nginx -t &&
sudo systemctl restart nginx &&
sudo certbot --nginx -d $domain &&
cd ~/devDesk &&
git clone $giturl &&
cd ~/devDesk/$gitname &&
case $sitetype in
    s|static)
        sudo cp -r ~/devDesk/$gitname/* /var/www/$domain
        ;;
    d|dynamic)
        npm run build &&
        npm start
        ;;
    c|custom)
        ;;
esac
```
