server {
    listen 80;
    server_name netly.upvaly.com www.netly.upvaly.com;

    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name netly.upvaly.com www.netly.upvaly.com;

    ssl_certificate /etc/letsencrypt/live/netly.upvaly.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/netly.upvaly.com/privkey.pem;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;

    access_log /var/log/nginx/netly-ui-access.log;
    error_log /var/log/nginx/netly-ui-error.log;

    gzip on;
    gzip_vary on;
    gzip_min_length 1024;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml text/javascript application/x-javascript;

    root /var/www/netly;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header Referrer-Policy "no-referrer-when-downgrade" always;
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
}

server {
    listen 80;
    server_name api.netly.upvaly.com;

    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name api.netly.upvaly.com;

    ssl_certificate /etc/letsencrypt/live/api.netly.upvaly.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/api.netly.upvaly.com/privkey.pem;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;

    access_log /var/log/nginx/netly-api-access.log;
    error_log /var/log/nginx/netly-api-error.log;

    client_max_body_size 10M;

    location / {
        proxy_pass http://localhost:8082;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
        proxy_read_timeout 300s;
        proxy_connect_timeout 75s;
    }

    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header Referrer-Policy "no-referrer-when-downgrade" always;
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
}
