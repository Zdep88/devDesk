read -p "Enter new user name : " name
sudo adduser $name
sudo usermod -aG sudo $name
