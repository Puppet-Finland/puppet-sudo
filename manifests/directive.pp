#
# == Define: sudo::directive
#
# Add a file to the /etc/sudoers.d directory
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
# Samuli Seppänen <samuli@openvpn.net>
# Mikko Vilpponen <vilpponen@protecomp.fi>
#
# == License
#
# BSD-lisence
# See file LICENSE for details
#
define sudo::directive (
    $ensure  = present,
    $content = '',
    $source  = ''
)
{

    # sudo skipping file names that contain a "."
    $dname = regsubst($name, '\.', '-', 'G')

    file {"/etc/sudoers.d/${dname}":
        ensure  => $ensure,
        owner   => root,
        group   => root,
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
