email=$1 &&
if [ -z "$email" ]; then
    read -p "Enter your email : " email
fi &&
ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519 -N "" &&
eval "$(ssh-agent -s)" &&
ssh-add ~/.ssh/id_ed25519 &&
key=$(cat ~/.ssh/id_ed25519.pub) &&
echo &&
echo "Public SSH key :" &&
echo "$key" &&
echo &&
read -p "Press enter to continue after copying the key to your GitHub account..."