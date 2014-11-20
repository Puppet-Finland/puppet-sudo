#
# == Class: sudo
#
# Install sudo
#
# == Parameters
#
# None at the moment
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
class sudo {

# Rationale for this is explained in init.pp of the sshd module
if hiera('manage_sudo', 'true') != 'false' {
    include sudo::install
    include sudo::config
}
}
