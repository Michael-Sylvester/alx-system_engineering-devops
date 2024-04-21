#Puppet code to remove passwaord athentication form ssh client config

file { '~/.ssh/config':
  ensure  => present,
  mode    => '0600',
  owner   => 'user',
  group   => 'user',
    content => "\
Host ALX-server
    HostName 54.160.115.226
    User ubuntu
    PasswordAuthentication no
    IdentityFile ~/.ssh/school

Host *
    PasswordAuthentication no
    IdentityFile ~/.ssh/school
  ",
  }
