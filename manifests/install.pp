#
# == Class: sudo::install
#
# This class installs the sudo package
#
class sudo::install {
    package {'sudo':
        ensure => installed,
    }
}
