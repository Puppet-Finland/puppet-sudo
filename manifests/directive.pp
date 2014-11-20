#
# == Define: sudo::directive
#
# Add a file to the /etc/sudoers.d directory
#
# == Parameters
#
# [*ensure*]
#   The status of the sudoers.d file fragment. Defaults to 'present'. Valid 
#   values are the same as for any File resource.
# [*content*]
#   A string containing the line(s) to add to the file fragment. For example:
#
#   "%staff    ALL=(ALL:ALL) ALL\n"
#
#   No default value.
#
# [*source*]
#   A pointer to a file on Puppet fileserver that contains the file fragment. 
#   See the "source" parameter in Puppet type reference for syntax. No default 
#   value.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# Samuli Seppänen <samuli@openvpn.net>
#
# Mikko Vilpponen <vilpponen@protecomp.fi>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
define sudo::directive (
    $ensure  = present,
    $content = '',
    $source  = ''
)
{

    include sudo::params

    # sudo skipping file names that contain a "."
    $dname = regsubst($name, '\.', '-', 'G')

    file { "sudoers.d-${dname}":
        name    => "${::sudo::params::sudoers_d}/${dname}",
        ensure  => $ensure,
        owner   => root,
        group   => "${::sudo::params::admingroup}",
        mode    => 0440,
        content => $content ? {
            ""      => undef,
            default => $content,
        },
        source  => $source ? {
            ""      => undef,
            default => $source,
        },
        require => Class['sudo::install'],
    }
}
