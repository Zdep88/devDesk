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
        echo "Ports already used :" &&
        grep -h "proxy_pass.*localhost:" /etc/nginx/sites-enabled/* 2>/dev/null | grep -o "localhost:[0-9]\+" | cut -d: -f2 | sort -n | uniq &&
        read -p "Application port : " port &&
        sudo sed -i "s/PORT/${port}/g" /etc/nginx/sites-available/$domain &&
        sudo ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/ &&
        sudo nginx -t &&
        sudo systemctl restart nginx &&
        sudo certbot --nginx -d $domain
        ;;
    c|custom)
        echo "Custom site setup not implemented yet."
        ;;
esac

read -p "press any key to continue" -n1 -s &&
sudo rm -r /var/www/$domain
sudo rm /etc/nginx/sites-enabled/$domain
sudo rm /etc/nginx/sites-available/$domain

# cd ~/ &&
# git clone $giturl &&
    # sudo cp -r ~/$gitname/* /var/www $siteurl &&
    # sudo cp ~/devDesk/templates/ static_server_bloc.txt /etc/nginxsites-available/$siteurl &&
    # sed -i "s/URL/$siteurl/g" ~/etcnginx/sites-available/$siteurl

# if [ "$site_type" = "dynamic" ]; then
#     tmux new -s $git_name
# fi