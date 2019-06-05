server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name www.spring4j.com;

    ssl_certificate /etc/nginx/cert/spring4j/fullchain.pem;

    ssl_certificate_key /etc/nginx/cert/spring4j/privkey.pem;

    location / {
        root   /etc/www;
        index  index.html index.htm;

    }

}
