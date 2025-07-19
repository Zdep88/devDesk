giturl=$1 &&
siteurl=$2 &&
if [ -z $giturl ]; then
  read -p "Git ssh url : " giturl
fi &&
if [ -z $siteurl ]; then
    read -p "New site URL : " siteurl
fi &&
gitname=$(basename $giturl .git) &&
cd ~/ &&
git clone $giturl &&
echo "Cloned $gitname" &&
echo "Creating site $siteurl" &&
echo "gitname : $gitname"


# if [[ "$answer" == "static" ]]; then
#     echo "static" &&
#     sudo cp -r ~/$gitname/* /var/www $siteurl &&
#     sudo cp ~/devDesk/templates/ static_server_bloc.txt /etc/nginxsites-available/$siteurl &&
#     sed -i "s/URL/$siteurl/g" ~/etcnginx/sites-available/$siteurl
#     break
# fi

# sudo touch /etc/nginx/sites-available/$siteurl &&
# sudo mkdir /var/www/$siteurl &&
# while true; do
#     read -p "Site type ? (static/dynamic/custom) " answer
#     if [ "$answer" == "static" ]; then
#         echo "static" &&
#         sudo cp -r ~/$gitname/* /var/www/$siteurl &&
#         sudo cp ~/devDesk/templates/static_server_bloc.txt /etc/nginx/sites-available/$siteurl &&
#         sed -i "s/URL/$siteurl/g" ~/etc/nginx/sites-available/$siteurl &&
#         break
#     elif [ "$answer" == "dynamic" ]; then
#         echo "dynamic" &&
#         break
#     elif [ "$answer" == "custom" ]; then
#         echo "custom" &&
#         break
#     fi
# done
# sudo certbot --nginx





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