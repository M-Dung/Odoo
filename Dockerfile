# Dựa trên image Odoo 18 chính thức
FROM odoo:18.0

# Chạy dưới quyền root để cài đặt các thư viện cần thiết
USER root

# Cài các thư viện hệ thống cần để build python-ldap (bắt buộc cho Odoo)
RUN apt-get update && apt-get install -y \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    gcc \
    python3-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Cài pip & requirements (vẫn dùng root)
RUN pip3 install --break-system-packages --no-cache-dir --ignore-installed pip setuptools wheel

# Copy file requirements vào container và cài
COPY requirements.txt /tmp/
RUN pip3 install --break-system-packages --no-cache-dir -r /tmp/requirements.txt

# Copy custom addons vào đúng thư mục
COPY ./custom_addons /mnt/extra-addons

# Copy file cấu hình Odoo & script entrypoint
COPY ./debian/odoo.conf /etc/odoo/odoo.conf
COPY ./entrypoint.sh /entrypoint.sh

# Chạy chmod để đảm bảo entrypoint được thực thi
RUN chmod +x /entrypoint.sh

# Mở cổng mặc định của Odoo
EXPOSE 8069

# Đổi lại user về 'odoo' cho an toàn
USER odoo

# Dùng entrypoint là file shell vừa
