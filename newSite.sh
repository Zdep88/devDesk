read -p "Git ssh url : " giturl &&
read -p "New domain : " domain &&
echo "Ports already used :" &&
grep -h "proxy_pass.*localhost:" /etc/nginx/sites-enabled/* 2>/dev/null | grep -o "localhost:[0-9]\+" | cut -d: -f2 | sort -n | uniq &&
read -p "Application port : " port &&
gitname=$(basename $giturl .git) &&
sudo cp ~/devDesk/server_bloc.txt /etc/nginx/sites-available/$domain &&
sudo sed -i "s/PORT/${port}/g" /etc/nginx/sites-available/$domain
sudo sed -i "s/example\.com/${domain}/g" /etc/nginx/sites-available/$domain &&
sudo nano /etc/nginx/sites-available/$domain
sudo mkdir /var/www/$domain &&
sudo ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/ &&
sudo nginx -t &&
sudo systemctl restart nginx &&
sudo certbot --nginx -d $domain &&
cd ~/devDesk &&
git clone $giturl &&
cd ~/devDesk/$gitname &&
tmux new -s $gitname &&
cd ~/ &&
sudo sed -i "/apps : \[/r ~/devDesk/templates/ecobloc.txt" ~/ecosystem.config.js &&
sudo sed -i "s/name : \"\",/name : \"${domain}\",/g" ~/ecosystem.config.js &&
sudo sed -i "s/cwd : \"\",/cwd : \"~\/devDesk\/${gitname}\",/g" ~/ecosystem.config.js &&
sudo nano ~/ecosystem.config.js
pm2 restart ecosystem.config.js &&
pm2 save &&
pm2 startup &&
sudo env PATH=$PATH:~/.nvm/versions/node/v22.17.1/bin ~/.nvm/versions/node/v22.17.1/lib/node_modules/pm2/bin/pm2 startup systemd -u $USER --hp ~
