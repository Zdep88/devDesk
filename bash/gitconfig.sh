read -p "Enter your full name : " name &&
read -p "Enter your email : " email &&
git config --global user.name "$name" &&
git config --global user.email "$email"