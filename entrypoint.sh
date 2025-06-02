#!/bin/bash
set -e

# Tên database mặc định nếu không được gán từ biến môi trường
DB_NAME=${DB_NAME:-odoo}

# Cập nhật database (nếu cần)
odoo -c /etc/odoo/odoo.conf -d $DB_NAME -u all --stop-after-init || true

# Khởi động Odoo
exec odoo -c /etc/odoo/odoo.conf
