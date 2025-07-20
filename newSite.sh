read -p "Git ssh url : " giturl &&
read -p "New domain : " domain &&
gitname=$(basename $giturl .git) &&
while true; do
    read -p "Site type ? (s)tatic, (d)ynamic, (c)ustom " sitetype &&
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
tmux new -s $gitname &&
sudo sed -i "s/example\.com/${domain}/g" /etc/nginx/sites-available/$domain


