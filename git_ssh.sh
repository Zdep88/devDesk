read -p "Enter your full name : " name
read -p "Enter your email : " email
sudo apt install -y git &&
git config --global user.name "$name" &&
git config --global user.email "$email" &&
ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519 -N "" &&
eval "$(ssh-agent -s)" &&
ssh-add ~/.ssh/id_ed25519 &&
printf "\nPublic SSH key :\n"
cat ~/.ssh/id_ed25519.pub
