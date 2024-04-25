# Install Nginx, server should listen on port 80 and redirect queries to /redirect_me

package{'nginx':
  ensure => installed,
}

service{'nginx':
  ensure => running,
  enable => true,
  require => Package['nginx'],
}

file{'/etc/nginx/sites-available/default':
  ensure   => present,
  content  => "server {
    listen 80;
    listen [::]:80;

    root /var/www/html;
    index index.html index.htm;

    server_name _;

    location /redirect_me {
      return 301 http://michaelsylvester.tech;
    }

    location / {
      return 200 'Hello World!';
      add_header Content-Type text/plain;
    }

}",
    notify  => Exec['restart nginx'],
}

file{'/var/www/html/index.html':
  ensure  => present,
  content => "Hello World!",
}

exec{'restart nginx':
  command     => 'service nginx reload',
  refreshonly => true,
}
