#
# == Class: sudo::install
#
# This class installs the sudo package
#
class sudo::install {

    include sudo::params

    package { 'sudo-sudo':
        name => "${::sudo::params::package_name}",
        ensure => installed,
    }
}
