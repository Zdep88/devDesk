echo ""
read -p "Enter your full name : " name
read -p "Enter your email : " email

sudo apt update
sudo apt upgrade -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.bashrc

nvm install --lts
nvm use --lts
npm install -g npm@latest
sudo apt install -y git
git config --global user.name "$name"
git config --global user.email "$email"

ssh-keygen -t ed25519 -C "$email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
printf "\nPublic SSH key :\n"
cat ~/.ssh/id_ed25519.pub
