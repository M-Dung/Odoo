#!/bin/bash
set -e

# Phân tích Internal Database URL
export DB_USER=odoo
export DB_PASSWORD=FAezsfGie1cYjjIiI9WXeYWQ34HQV9L3
export DB_HOST=dpg-d0uiviidbo4c73b6ijig-a
export DB_PORT=5432
export DB_NAME=odoo_w39a

# Cập nhật database (nếu cần)
odoo -c /etc/odoo/odoo.conf \
  --db_host=$DB_HOST \
  --db_port=$DB_PORT \
  --db_user=$DB_USER \
  --db_password=$DB_PASSWORD \
  -d $DB_NAME -u all --stop-after-init || true

# Khởi động Odoo
exec odoo -c /etc/odoo/odoo.conf \
  --db_host=$DB_HOST \
  --db_port=$DB_PORT \
  --db_user=$DB_USER \
  --db_password=$DB_PASSWORD
