{
    'name': 'Báo cáo đơn hàng - tồn kho - cơ hội',
    'version': '3.0',
    'description': """
        - Màn hình Thống kê Đơn hàng: Xem đơn hàng với các bộ lọc (trạng thái, thời gian,...) và biểu đồ thống kê.
        - Màn hình Báo cáo Tồn kho: Xem số lượng sản phẩm còn lại trong kho.
        - Màn hình Báo cáo Cơ hội: Hiển thị danh sách các cơ hội bán hàng.
    """,
    'summary': """
        Module cung cấp màn hình thống kê đơn hàng, báo cáo tồn kho, báo cáo cơ hội bán hàng.
    """,
    'author': 'LamTuanThinh22521408',
    'website': '',
    'category': 'Reporting',
    'depends': ['sale_management', 'stock', 'board', 'uom', 'crm'],
    'data': [
        'security/ir.model.access.csv',
        'views/sale_order_statistics_views.xml',
        'views/inventory_report_views.xml',
        'views/crm_lead_report_views.xml',
        'views/report_menus.xml',
    ],
    'installable': True,
    'application': True,
    'auto_install': False,
    'license': 'LGPL-3'
}
