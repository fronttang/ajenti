server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name plex.spring4j.com;

    ssl_certificate /etc/nginx/cert/spring4j/fullchain.pem;

    ssl_certificate_key /etc/nginx/cert/spring4j/privkey.pem;

    location / {
        proxy_set_header        Host                $http_host;
        proxy_set_header        X-Real-IP           $remote_addr;
        proxy_set_header        X-Forwarded-For     $proxy_add_x_forwarded_for;
        proxy_set_header        X-Forwarded-Proto   $scheme;
        proxy_intercept_errors  on;
        proxy_http_version      1.1;

        proxy_pass http://192.168.1.252:32400;

    }

}
