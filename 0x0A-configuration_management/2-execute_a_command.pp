# execute command to kill process killmeow

exec{
  'terminate killmeow':
    command => 'pkill killmeow',
    path    => ['/bin', '/usr/bin'],
    onlyif  => 'pgrep killmeow',
}
