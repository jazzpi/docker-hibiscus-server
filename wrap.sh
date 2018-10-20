#!/bin/bash

set -e

# See for instructions:
# http://www.willuhn.de/products/hibiscus-server/install.php

# delete db config for use of embedded db
rm /hibiscus-server/cfg/de.willuhn.jameica.hbci.rmi.HBCIDBService.properties

# Write HTTP settings
ssl_val=false
if [ "$USE_SSL" != "" ]; then
    ssl_val=true
fi
cat > /hibiscus-server/cfg/de.willuhn.jameica.webadmin.Plugin.properties <<EOF
listener.http.address=0.0.0.0
listener.http.port=${PORT-8080}
listener.http.auth=true
listener.http.ssl=${ssl_val}
EOF

${@-/hibiscus-server/jameicaserver.sh -p $PASSWORD -f /srv/hibiscus}
