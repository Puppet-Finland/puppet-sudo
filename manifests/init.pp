#
# == Class: sudo
#
# Install sudo
#
# == Parameters
#
# [*manage*]
#   Whether to manage sudo with Puppet or not. Valid values are true (default) 
#   and false.
# [*directives*]
#   A hash of sudo::directive resources to realize.
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
    Boolean $manage = true,
    Hash    $directives = {}
)
{

if $manage {
    include ::sudo::install

    class { '::sudo::config':
        directives => $directives,
    }
}
}
