#
# == Class: sudo::params
#
# Defines some variables based on the operating system
#
class sudo::params {

    include ::os::params

    case $::osfamily {
        'RedHat': {
            $package_name = 'sudo'
            $sudoers_d = '/etc/sudoers.d'
            $sudogroup = 'wheel'
        }
        'Debian': {
            $package_name = 'sudo'
            $sudoers_d = '/etc/sudoers.d'
            $sudogroup = 'sudo'
        }
        'FreeBSD': {
            $package_name = 'sudo'
            $admingroup = 'wheel'
            $sudoers_d = '/usr/local/etc/sudoers.d'
            $sudogroup = 'wheel'
        }
        default: {
            fail("Unsupported operatingsystem ${::osfamily}")
        }
    }
}
