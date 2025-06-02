{
    'name': 'MoMo Payments',
    'version': '1.0',
    'summary': 'Tích hợp thanh toán MoMo vào đơn bán hàng',
    'description': """
        Module tích hợp nút thanh toán MoMo vào đơn bán hàng trong Odoo.
    """,
    'category': 'Sales',
    'author': 'Your Name or Company',
    'website': 'https://yourcompany.com',
    'depends': ['sale', 'base'],
    'data': [
        'views/sale_order_view.xml',
    ],
    'installable': True,
    'application': False,
    'auto_install': False,
}
