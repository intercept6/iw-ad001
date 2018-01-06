#!/bin/bash
cat <<'EOF' | sudo tee /etc/sysconfig/clock > /dev/null
ZONE="Asia/Tokyo"
UTC="false"
EOF
sudo cp -fp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
