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

/opt/puppetlabs/bin/puppet apply --verbose --debug --detailed-exitcodes --modulepath ./modules --hiera_config ./hieradata/hiera.yaml manifests
