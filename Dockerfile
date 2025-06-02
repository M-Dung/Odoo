FROM odoo:16

# Cài thêm Python package nếu cần
COPY requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt

# Copy custom addons nếu có
COPY ./custom_addons /mnt/extra-addons

# Copy file cấu hình
COPY ./debian/odoo.conf /etc/odoo/odoo.conf

# Entrypoint để khởi động đúng cách
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
