#Puppet code to remove passwaord athentication form ssh client config

file { '~/etc/ssh/ssh_config':
  ensure  => present,
  mode    => '0600',
  content => "
Include /etc/ssh/ssh_config.d/*.conf

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
