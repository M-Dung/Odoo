#!/bin/bash
set -e

# Chạy lệnh update database nếu cần
odoo -c /etc/odoo/odoo.conf -d $odoo -u all --stop-after-init || true

# Khởi động Odoo
exec odoo -c /etc/odoo/odoo.conf
