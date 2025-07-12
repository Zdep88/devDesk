read -p "Enter your full name : " name &&
read -p "Enter your email : " email &&
sudo apt install -y git &&
git config --global user.name "$name" &&
git config --global user.email "$email"
