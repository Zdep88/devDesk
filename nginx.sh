sudo apt install -y nginx
sudo sed -i 's/^[[:space:]]*#[[:space:]]*server_names_hash_bucket_size/        server_names_hash_bucket_size/' /etc/nginx/nginx.conf
read -p "Do you want to create a new site ?(Y/n) " create_site
if [[ $create_site == "Y" || $create_site == "y" || -z $create_site ]]; then
    read -p "Site url : " site
    sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/$site
    sudo nano /etc/nginx/sites-available/$site
    sudo ln -s /etc/nginx/sites-available/$site /etc/nginx/sites-enabled/
    sudo nginx -t && sudo systemctl restart nginx
fi