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
define sudo::directive
(
    Enum['present','absent'] $ensure  = present,
    Optional[String]         $content = undef,
    Optional[String]         $source  = undef
)
{

    include ::sudo::params

    # sudo skipping file names that contain a "."
    $dname = regsubst($name, '\.', '-', 'G')

    $fragment_content = $content ? {
        undef   => undef,
        default => $content,
    }
    $fragment_source = $source ? {
        undef   => undef,
        default => $source,
    }

    file { "sudoers.d-${dname}":
        ensure  => $ensure,
        name    => "${::sudo::params::sudoers_d}/${dname}",
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        mode    => '0440',
        content => $fragment_content,
        source  => $fragment_source,
        require => Class['sudo::install'],
    }
}
