#!/bin/bash

echo "==== Inject DB GenieACS ===="

# Langsung eksekusi mongosh dengan perintah sekaligus
mongosh <<EOF
use genieacs
db.users.insertOne({
    _id: "egik",
    roles: "admin",
    password: "d120575fa1f2a896f8dddea0a5f26d1b97e7eddc685a18e3c925fd81d2a05dd0c9ee6fda29ace623cb72705c15285aaec11f3fd453a1e5c18d419ffd5ad67b6a3389207deba379aaf78f78f21ea743206408c06382f42a3dc5cb355b2bf43b636816f05f49293819805ba4a96ef35d16ff7888974bc4d71fc9f30d1c576764ed",
    salt: "19a6362f3db89cd9a1b06023dd133a45d38834e2eefaa81b6ab80f089c2273652b651046c9409b9f91084ef3c4a860b3026e41cd8bc8a06f4a5f16ae5895bd4c"
})
EOF

echo "==== Inject Sukses By exoforb ===="

# Restart semua service GenieACS biar user baru langsung aktif
echo "Restarting GenieACS services..."
systemctl restart genieacs-cwmp
systemctl restart genieacs-nbi
systemctl restart genieacs-fs
systemctl restart genieacs-ui

echo "==== Inject Sukses By exoforb ===="

