echo &&
read -p "Git ssh url : " giturl &&
read -p "New domain : " domain &&
echo "Ports already used :" &&
grep -h "proxy_pass.*localhost:" /etc/nginx/sites-enabled/* 2>/dev/null | grep -o "localhost:[0-9]\+" | cut -d: -f2 | sort -n | uniq &&
read -p "Application port : " port &&
gitname=$(basename $giturl .git) &&
sudo cp /home/$USER/devDesk/server_bloc.txt /etc/nginx/sites-available/$domain &&
sudo sed -i "s/example\.com/${domain}/g" /etc/nginx/sites-available/$domain &&
sudo sed -i "s/PORT/${port}/g" /etc/nginx/sites-available/$domain &&
sudo nano /etc/nginx/sites-available/$domain &&
sudo mkdir /var/www/$domain &&
sudo ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/ &&
sudo nginx -t &&
sudo systemctl restart nginx &&
sudo certbot --nginx -d $domain &&
cd /home/$USER/ &&
git clone $giturl &&
cd /home/$USER/$gitname &&
tmux new -s $gitname &&
cd /home/$USER/ &&
sudo sed -i "/apps : \[/r /home/$USER/devDesk/ecobloc.txt" /home/$USER/ecosystem.config.js &&
sudo sed -i "s/name : \"\",/name : \"${gitname}\",/g" /home/$USER/ecosystem.config.js &&
sudo sed -i "s/cwd : \"\",/cwd : \"${gitname}\",/g" /home/$USER/ecosystem.config.js &&
sudo nano /home/$USER/ecosystem.config.js &&
pm2 start /home/$USER/ecosystem.config.js &&
pm2 save