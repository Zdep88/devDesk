read -p "Enter your email : " email &&
sh ~/devDesk/bash/up.sh &&
sh ~/devDesk/bash/node.sh &&
sh ~/devDesk/bash/ssh.sh "$email" &&
sh ~/devDesk/bash/nginx.sh &&
sh ~/devDesk/bash/certbot.sh &&
while true; do
    read -p "Host a new site ? (y/n) " answer &&
    if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
        sh ~/devDesk/desks/site.sh
    elif [[ "$answer" == "n" || "$answer" == "N" ]]; then
        break
    fi
done
sudo certbot --nginx