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

# Cài pip và các requirements (vẫn dùng root)
RUN pip3 install --upgrade pip setuptools wheel --break-system-packages

COPY requirements.txt /tmp/
RUN pip3 install --break-system-packages --no-cache-dir -r /tmp/requirements.txt

# Copy custom addons
COPY ./custom_addons /mnt/extra-addons

# Copy cấu hình và entrypoint
COPY ./debian/odoo.conf /etc/odoo/odoo.conf
COPY ./entrypoint.sh /entrypoint.sh

# ⚠️ Chạy chmod khi vẫn còn quyền root!
RUN chmod +x /entrypoint.sh

# Quay lại user odoo để chạy an toàn
USER odoo

ENTRYPOINT ["/entrypoint.sh"]
