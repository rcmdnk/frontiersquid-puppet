#!/usr/bin/env bash

{
curl -LO https://github.com/mickaneda/frontiersquid-puppet/archive/master.tar.gz
tar xzf  master.tar.gz
cd frontiersquid-puppet-master
./setup.sh
/opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp
} >& ~/startup.log
