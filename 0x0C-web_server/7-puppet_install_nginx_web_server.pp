# Install Nginx and configure server block
package { 'nginx':
  ensure => installed,
}

file { '/etc/nginx/sites-available/default':
  ensure  => present,
    content => "
    server {
      listen 80;
      listen [::]:80;
      server_name _;

      root /var/www/html;
      index index.html index.htm;

      location / {
        try_files \$uri \$uri/ =404;
        echo 'Hello World!';
      }

      location /redirect_me {
        return 301 https://www.example.com;
      }
    }
    ",
}

file { '/var/www/html/index.html':
  ensure  => present,
  content => "Hello World!",
}

# Restart Nginx service
service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/nginx/sites-available/default'],
}
