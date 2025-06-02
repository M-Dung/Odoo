#!/bin/bash
set -e

# Thông tin database
export DB_USER=odoo
export DB_PASSWORD=F4ezsf6ielcYjjI1iJ9XeYWQ34HQVL3
export DB_HOST=dpg-d8uviidbod4c73b6ijig-a
export DB_PORT=5432
export DB_NAME=odoo_w39a

echo "🔄 Updating database..."
odoo -c /etc/odoo/odoo.conf \
  --db_host=$DB_HOST \
  --db_port=$DB_PORT \
  --db_user=$DB_USER \
  --db_password=$DB_PASSWORD \
  -d $DB_NAME -u all --stop-after-init || echo "⚠️ DB update failed, but continuing..."

echo "🚀 Starting Odoo..."
exec odoo -c /etc/odoo/odoo.conf \
  --db_host=$DB_HOST \
  --db_port=$DB_PORT \
  --db_user=$DB_USER \
  --db_password=$DB_PASSWORD
