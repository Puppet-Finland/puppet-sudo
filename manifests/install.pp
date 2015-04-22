#
# == Class: sudo::install
#
# This class installs the sudo package
#
class sudo::install inherits sudo::params {

    package { 'sudo-sudo':
        ensure => installed,
        name   => $::sudo::params::package_name,
    }
}
