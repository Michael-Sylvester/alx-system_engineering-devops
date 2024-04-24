# Install Nginx, server should listen on port 80 and redirect queries to /redirect_me

package{'nginx':
  ensure => present,
  
}

file{'default':
  ensure  => present,
  content => "server {
    listen 80 default;
    listen [::]:80;

    root /var/www/html;
    index index.html index.htm;

    server_name _;

    location /redirect_me {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }

        location / {
        try_files \$uri \$uri/ =404;
    }

}"

}
