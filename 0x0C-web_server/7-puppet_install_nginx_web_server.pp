
package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  require    => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "server {
  listen 80 default_server;
  listen [::]:80 default_server;

  location / {
    return 200 'Hello World!';
    add_header Content-Type text/plain;
  }

  location /redirect_me {
    return 301 http://michaelsylvester.tech/;
  }
}",
    notify  => Service['nginx'],
  }
