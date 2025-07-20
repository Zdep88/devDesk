read -p "Enter your email : " email &&
sh ~/devDesk/bash/up.sh &&
sh ~/devDesk/bash/node.sh &&
sh ~/devDesk/bash/nginx.sh &&
sh ~/devDesk/bash/certbot.sh &&
sh ~/devDesk/bash/ssh.sh "$email"