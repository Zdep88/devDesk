read -p "Enter your email : " email &&
sh ~/devDesk/bash/up.sh &&
sh ~/devDesk/bash/node.sh &&
sh ~/devDesk/bash/nginx.sh &&
sh ~/devDesk/bash/certbot.sh &&
sh ~/devDesk/bash/ssh.sh "$email" &&
cd ~/devDesk
while true; do
    read -p "Host new site ? (y/n) : " choix
    case $choix in
        y|Y)
            echo "new site"
            ;;
        n|N)
            echo "stop"
            break
            ;;
    esac
done