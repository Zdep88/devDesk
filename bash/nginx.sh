sudo apt install -y nginx
printf "\nUncomment line : \nserver_names_hash_bucket_size 64;\n"
read -n 1 -s -p "Press any key when ready."
sudo nano /etc/nginx/nginx.conf

read -p "Do you want to create a new site ?(Y/n) " create_site
if [[ $create_site == "Y" || $create_site == "y" || -z $create_site ]]; then
    read -p "Site url : " site
    sudo nano /etc/nginx/sites-available/$site
    sudo ln -s /etc/nginx/sites-available/$site /etc/nginx/sites-enabled/
    sudo nginx -t && sudo systemctl restart nginx
fi
