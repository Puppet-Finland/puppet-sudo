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
# include sudo
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
class sudo {
    include sudo::install
}
