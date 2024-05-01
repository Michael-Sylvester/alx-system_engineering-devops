# 2-puppet_custom_http_response_header.pp

# Install HAProxy package
package { 'haproxy':
  ensure => installed,
}

# Configure HAProxy
file { '/etc/haproxy/haproxy.cfg':
  ensure  => file,
  content => template('haproxy/haproxy.cfg.erb'), # Use a template to generate the configuration
  require => Package['haproxy'],
  notify  => Service['haproxy'],
}

# Template for HAProxy configuration
# haproxy/haproxy.cfg.erb
<% @hostname = fqdn_scope() %>
global
log /dev/log    local0
log /dev/log    local1 notice
chroot /var/lib/haproxy
stats socket /run/haproxy/admin.sock mode 660 level admin expose-fd listeners
stats timeout 30s
user haproxy
group haproxy
daemon

defaults
log     global
mode    http
option  httplog
option  dontlognull
timeout connect 5000
timeout client  50000
timeout server  50000

frontend http_front
bind *:80
stats uri /haproxy?stats
default_backend http_back

backend http_back
balance roundrobin
server web1 <web1_ip>:80 check
server web2 <web2_ip>:80 check

# Restart HAProxy service
service { 'haproxy':
  ensure    => running,
  enable    => true,
  require   => File['/etc/haproxy/haproxy.cfg'],
}
