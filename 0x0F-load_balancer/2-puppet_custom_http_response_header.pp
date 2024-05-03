# configures an ubuntu server using puppet in the manner of task 0:

exec { 'apt_update':
  command => '/usr/bin/apt-get update',
}

-> package { 'nginx' :
  ensure => installed,
}

-> file { '/var/www/html/index.html' :
  content => 'Holberton School!',
}

-> file_line { 'add header':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  line   => "\tadd_header X-Served-By ${hostname};",
  after  => 'server_name _;',
}

-> service { 'nginx':
  ensure => running,
}
