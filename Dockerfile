FROM odoo:18.0

USER root

# Cài thư viện hệ thống cần thiết để build python-ldap
RUN apt-get update && apt-get install -y \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    gcc \
    python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER odoo

# Nâng cấp pip trước
RUN pip3 install --upgrade pip setuptools wheel --break-system-packages

# Cài đặt requirements với --break-system-packages và không cache
COPY requirements.txt /tmp/
RUN pip3 install --break-system-packages --no-cache-dir -r /tmp/requirements.txt

# Copy custom addons nếu có
COPY ./custom_addons /mnt/extra-addons

# Copy file cấu hình và entrypoint script
COPY ./debian/odoo.conf /etc/odoo/odoo.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
