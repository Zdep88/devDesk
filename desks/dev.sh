read -p "Enter your full name : " name &&
read -p "Enter your email : " email &&
sh ~/devDesk/bash/git.sh "$name" "$email" &&
sh ~/devDesk/bash/ssh.sh "$email" &&
cd ~/devDesk &&
code .