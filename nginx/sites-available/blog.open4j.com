server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name blog.open4j.com;

    ssl_certificate /etc/nginx/cert/open4j/fullchain.pem;

    ssl_certificate_key /etc/nginx/cert/open4j/privkey.pem;

    location / {
        root   /etc/blog;
        index  index.html index.htm;

    }

}
