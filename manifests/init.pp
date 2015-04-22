#
# == Class: sudo
#
# Install sudo
#
# == Parameters
#
# [*manage*]
#   Whether to manage sudo with Puppet or not. Valid values are 'yes' (default) 
#   and 'no'.
# [*directives*]
#   A hash of sudo::directive resources to realize.
#
# == Examples
#
#    include sudo
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
class sudo
(
    $manage = 'yes',
    $directives = {}
)
{

if $manage == 'yes' {
    include ::sudo::install

    class { '::sudo::config':
        directives => $directives,
    }
}
}
