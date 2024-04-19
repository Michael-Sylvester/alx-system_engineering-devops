# execute command to kill process killmeow

exec{
  'terminate killmeow':
    command => '/usr/bin/pkill killmeow'
}
