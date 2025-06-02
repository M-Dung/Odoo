#!/bin/bash
set -e

export DB_USER=odoo
export DB_PASSWORD=...
export DB_HOST=...
export DB_PORT=5432
export DB_NAME=...

# Chạy cập nhật database (nếu cần)
odoo -c /etc/odoo/odoo.conf \
  --db_host=$DB_HOST \
  --db_port=$DB_PORT \
  --db_user=$DB_USER \
  --db_password=$DB_PASSWORD \
  -d $DB_NAME -u all --stop-after-init

# Khởi động Odoo chính thức
exec odoo -c /etc/odoo/odoo.conf \
  --db_host=$DB_HOST \
  --db_port=$DB_PORT \
  --db_user=$DB_USER \
  --db_password=$DB_PASSWORD
