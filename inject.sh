#!/bin/bash

echo "==== Inject DB GenieACS ===="

# Langsung eksekusi mongosh dengan perintah sekaligus
mongosh <<EOF
use genieacs
db.users.insertOne({
    _id: "tes",
    roles: "teknisi",
    password: "889f13d40240998b4236c65b019f2cf228f3f841d788b060d9873fe9a8ab18b5fa7b1d66014843ef0e6d1b579dabf3b88eb687bbbb8a5f1fbe62ab2462cbf71e42c5597665992079322279f0fb55d1d7c87fc282c65c1b90c0f3bd0815fd0069530bc805620ba7ca2d7151c807bf0e0eb6d077f2295098bec10c8544b899cb74",
    salt: "a4ea7a3a11aeb0ca6977080e0be0aade17b23a4929b8438d744bce08d88ec1b3cee659898784561ac167a0ac32edb9f255ff96e4750457cc0ea3aa888f01f2b2"
})
EOF

echo "==== Inject Sukses By exoforb ===="

# Tanya sebelum restart service
read -p "Restart service GenieACS untuk menerapkan injek? (y/n): " jawab

if [[ "$jawab" == "y" || "$jawab" == "Y" ]]; then
    echo "Restarting GenieACS services..."
    systemctl restart genieacs-cwmp
    systemctl restart genieacs-nbi
    systemctl restart genieacs-fs
    systemctl restart genieacs-ui
    echo "==== Restart Service Sukses ===="
else
    echo "==== Skip restart service ===="
fi

# Langsung hapus folder setelah restart (tanpa konfirmasi)
rm -rf ../genie
rm -rf ../tools

echo "==== Semua proses selesai ===="
