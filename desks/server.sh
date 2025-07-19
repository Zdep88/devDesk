read -p "Enter your email : " email &&
sh ~/devDesk/bash/up.sh &&
sh ~/devDesk/bash/node.sh &&
sh ~/devDesk/bash/ssh.sh "$email" &&
cd ~/devDesk/
echo &&
echo "bash :" &&
ls ~/devDesk/bash/ &&
echo &&
echo "desks :" &&
ls ~/devDesk/desks