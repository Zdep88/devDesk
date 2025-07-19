echo "Setting up server environment..."

# read -p "Git ssh url : " git_url &&
# read -p "New site URL : " site_url &&
# git_name=$(basename "$git_url" .git) &&
# mkdir ~/code &&
# cd ~/code &&
# git clone "$git_url" &&
# sudo touch /etc/nginx/sites-available/$site_url &&
# while true; do
#     read -p "Choose between type 'static' or 'dynamic' : " site_type
#     if [ "$site_type" = "static" ] || [ "$site_type" = "dynamic" ]; then
#         break
#     fi
# done
# if [ "$site_type" = "static" ]; then
#     sudo mkdir /var/www/$site_url &&
#     sudo cp -r ~/code/$git_name/* /var/www/$site_url &&
#     sudo tee /etc/nginx/sites-available/$site_url >/dev/null <<EOF

# EOF
# else
#     echo "Ports already used :" &&
#     grep -h "proxy_pass.*localhost:" /etc/nginx/sites-enabled/* 2>/dev/null | grep -o "localhost:[0-9]\+" | cut -d: -f2 | sort -n | uniq &&
#     read -p "Application port : " app_port &&
 
#     sudo touch /etc/nginx/sites-available/$site_url &&
#     sudo tee /etc/nginx/sites-available/$site_url >/dev/null <<EOF

# EOF
# fi
# sudo ln -s /etc/nginx/sites-available/$site_url /etc/nginx/sites-enabled/ &&
# sudo nginx -t &&
# sudo systemctl restart nginx &&
# sudo certbot --nginx &&
# if [ "$site_type" = "dynamic" ]; then
#     tmux new -s $git_name
# fi