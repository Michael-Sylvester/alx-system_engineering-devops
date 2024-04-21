# execute command to kill process killmeow

exec{
  'terminate killmenow':
    command => 'pkill killmenow',
    path    => ['/bin', '/usr/bin'],
    onlyif  => 'pgrep killmenow',
}
