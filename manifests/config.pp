#
# == Class: sudo::config
#
# Configure sudo.
#
# The primary reason for creating this class is to install a sudoers.d fragment 
# that allows users in a sudo group to run command as root. It seems that most 
# operating systems - at least Debian, Ubuntu, RHEL and FreeBSD - come with a 
# default sudoers files that include files from the sudoers.d directory. Also, 
# their default sudoers files are quite different, so using a single 
# configuration file on every platform might have unexpected consequences.
#
# More sudo directives can be added to the node definitions using the 
# sudo::directive define.
#
class sudo::config {

    # Allow users in the somewhat OS-specific sudo group to run commands as root
    sudo::directive { 'sudogroup':
        content => "%${::sudo::params::sudogroup}   ALL=(ALL:ALL) ALL\n",
    }
}
