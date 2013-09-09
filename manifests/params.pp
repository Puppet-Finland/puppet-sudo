#
# == Class: sudo::params
#
# Defines some variables based on the operating system
#
class sudo::params {

    case $::osfamily {
        'RedHat': {
            $package_name = 'sudo'
            $admingroup = 'root'
            $sudoers_d = '/etc/sudoers.d'
            $sudogroup = 'wheel'
        }
        'Debian': {
            $package_name = 'sudo'
            $admingroup = 'root'
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
            $package_name = 'sudo'
            $admingroup = 'root'
            $sudoers_d = '/etc/sudoers.d'
            $sudogroup = 'sudo'
        }
    }
}
