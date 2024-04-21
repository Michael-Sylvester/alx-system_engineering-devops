# Install flask from pip3 with specific dependancy versions

# Ensure Python 3.8.10 is installed
package { 'python3.8':
  ensure => '3.8.10',
}

# And that the pip package for insatalling flask in installed
package{
  'python3-pip':
    ensure => installed,
}

# Ensure werkzeug 2.1.1 is installed
package{
  'werkzeug':
    ensure   =>'2.1.1',
    provider => 'pip3',
}

package{
'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Package['python3-pip', 'werkzeug'];
}
