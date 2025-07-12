curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash &&
source ~/.bashrc &&
nvm install --lts &&
nvm use --lts &&
npm install -g npm@latest
