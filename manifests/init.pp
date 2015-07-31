# == Class: motd
#
# Module to manage motd
#
class motd ( ) {
  #$banner = $::role ? {
  #  'puppetmaster' => "\n# puppetmaster message of the day\n\n",
  #  'webserver'    => "\n# webserver message of the day\n\n",
  #  default        => "\n# default message of the day\n\n",
  #}
  case $::role {
    'puppetmaster': { $banner = "\n# puppetmaster message of the day\n\n" }
    default: { fail('Only used on puppetmaster role.') }
  }

  file { '/etc/motd':
    ensure  => file,
    #source => 'puppet:///modules/motd/motd',
    content => $banner,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
