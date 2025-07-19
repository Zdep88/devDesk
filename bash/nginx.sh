sudo apt install -y nginx &&
sudo sed -i 's/^[[:space:]]*#[[:space:]]*server_names_hash_bucket_size/        server_names_hash_bucket_size/' /etc/nginx/nginx.conf &&
sudo nginx -t &&
sudo systemctl restart nginx