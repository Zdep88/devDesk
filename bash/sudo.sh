username=$1 &&
if [ -z "$username" ]; then
  read -p "Enter username: " username
fi &&
sudo adduser "$username" &&
sudo usermod -aG sudo "$username"