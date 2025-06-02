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

# Cài thêm Python package nếu cần
COPY requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt

# Copy custom addons nếu có
COPY ./addons /mnt/extra-addons

# Copy file cấu hình và entrypoint script
COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Entrypoint
ENTRYPOINT ["/entrypoint.sh"]
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

# Cài thêm Python package nếu cần
COPY requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt

# Copy custom addons nếu có
COPY ./addons /mnt/extra-addons

# Copy file cấu hình và entrypoint script
COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Entrypoint
ENTRYPOINT ["/entrypoint.sh"]

