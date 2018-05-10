sudo
====

A Puppet module for installing and configuring sudo

# Module usage

Enable users in the default admin group (sudo or wheel) to run commands as root:

    include ::sudo

Add an additional one-liner sudo directive (note the linefeed at the end):

    sudo::directive { 'staff':
      content => '%staff    ALL=(ALL:ALL) ALL\n',
    }

Add a fragment based on an ERB template:

    sudo::directive { 'sudorules':
      content => template('profile/sudorules.erb'),
    }

Add a fragment from a static file:

    sudo::directive { 'sudorules':
      source => 'puppet:///profile/sudorules',
    }

For details refer to [init.pp](manifests/init.pp) 
and [directive.pp](manifests/directive.pp)
