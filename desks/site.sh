giturl=$1 &&
domain=$2 &&
if [ -z $giturl ]; then
  read -p "Git ssh url : " giturl
fi &&
if [ -z $domain ]; then
    read -p "New domain : " domain
fi &&
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
echo "GitUrl: $giturl" &&
echo "Domain: $domain" &&
echo "GitName: $gitname" &&
echo "SiteType: $sitetype"

case $sitetype in
    s|static)
        sudo mkdir /var/www/$domain &&
        sudo cp ~/devDesk/templates/static_server_bloc.txt /etc/nginx/sites-available/$domain &&
        sudo sed -i "s/example\.com/${domain}/g" /etc/nginx/sites-available/$domain &&
        sudo ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/ &&
        sudo nginx -t &&
        sudo systemctl restart nginx &&
        sudo certbot --nginx -d $domain
        ;;
    d|dynamic)
        sudo mkdir /var/www/$domain &&
        sudo cp ~/devDesk/templates/dynamic_server_bloc.txt /etc/nginx/sites-available/$domain &&
        # sudo sed -i "s/example\.com/${domain}/g" /etc/nginx/sites-available/$domain &&
        # sudo ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/ &&
        # sudo nginx -t &&
        # sudo systemctl restart nginx &&
        # sudo certbot --nginx -d $domain
        ;;
    c|custom)
        echo "Custom site setup not implemented yet."
        ;;
esac

sudo rm -r /var/www/$domain
sudo rm /etc/nginx/sites-enabled/$domain
sudo rm /etc/nginx/sites-available/$domain

# sudo touch /etc/nginx/sites-available/$siteurl

# cd ~/ &&
# git clone $giturl &&
    # sudo cp -r ~/$gitname/* /var/www $siteurl &&
    # sudo cp ~/devDesk/templates/ static_server_bloc.txt /etc/nginxsites-available/$siteurl &&
    # sed -i "s/URL/$siteurl/g" ~/etcnginx/sites-available/$siteurl



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