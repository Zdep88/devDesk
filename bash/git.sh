name=$1 &&
email=$2 &&
if [ -z "$name" ]; then
  read -p "Enter your full name : " name
fi &&
if [ -z "$email" ]; then
  read -p "Enter your email : " email
fi &&
git config --global user.name "$name" &&
git config --global user.email "$email"