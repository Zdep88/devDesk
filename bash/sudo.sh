read -p "Enter username: " username &&
sudo adduser "$username" &&
sudo usermod -aG sudo "$username"