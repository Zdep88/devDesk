read -p "Enter your email : " email
ssh-keygen -t ed25519 -C "$email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
printf "\nPublic SSH key :\n"
cat ~/.ssh/id_ed25519.pub
