#!/bin/bash

KEYNAME="iw-ad001"
PUBLIC_KEY="./${KEYNAME}.pub"
PRIVATE_KEY="./${KEYNAME}"

echo -e  'y\n' | ssh-keygen -t rsa -b 4096 -C "hoge@example.com" -f ./iw-ad001 << EOF

EOF

if [ ! -f ${PUBLIC_KEY} ]; then
        echo "ERROR : File not found [${PUBLIC_KEY}]"

else
  cat << EOF > variable_key.tf
  variable "key_pair" {
    default = {
  		public_key = "$(cat ${PUBLIC_KEY})"
  	}
  }
EOF
        chmod 600 ${PRIVATE_KEY}

fi
