#!/bin/bash

function usage() {
    cat << EOF
usage: $0 options

  OPTIONS:
     argument 1: manifest
     -?    [optional] Help documentation
EOF
}

while getopts "f:?" OPTION; do
  case ${OPTION} in
    ?)
      usage
      exit 1
      ;;
  esac
done

/usr/local/bin/puppet apply --verbose --debug --detailed-exitcodes --modulepath modules:site:thirdparty:$basemodulepath --hiera_config ./hieradata/hiera.yaml manifests 2>&1 | tee -a /var/log/puppet-apply.log
