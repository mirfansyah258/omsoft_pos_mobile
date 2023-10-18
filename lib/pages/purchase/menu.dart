import 'package:flutter/material.dart';
import 'package:omsoft_pos_mobile/components/MenuItem.dart';

class PurchaseMenu extends StatefulWidget {
  const PurchaseMenu({super.key});

  @override
  State<PurchaseMenu> createState() => _PurchaseMenuState();
}

class _PurchaseMenuState extends State<PurchaseMenu> {
  final purchaseMenu = <Map>[
    {
      'id': '1',
      'label': 'Order Pembelian',
      'icon': Icons.local_shipping_outlined,
      'route': ''
    },
    {
      'id': '2',
      'label': 'Nota / Faktur Pembelian',
      'icon': Icons.request_quote_outlined,
      'route': ''
    },
    {
      'id': '3',
      'label': 'Retur Pembelian',
      'icon': Icons.autorenew_outlined,
      'route': ''
    },
    {
      'id': '4',
      'label': 'Pembayaran Hutang',
      'icon': Icons.payments_outlined,
      'route': ''
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      childAspectRatio: (1 / .8),
      children: List.generate(4, (idx) {
        return MenuItem(item: purchaseMenu[idx]);
      }),
    );
  }
}
