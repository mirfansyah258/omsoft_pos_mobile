import 'package:flutter/material.dart';
import 'package:omsoft_pos_mobile/components/MenuItem.dart';

class SalesBackOfficeMenu extends StatefulWidget {
  const SalesBackOfficeMenu({super.key});

  @override
  State<SalesBackOfficeMenu> createState() => _SalesBackOfficeMenuState();
}

class _SalesBackOfficeMenuState extends State<SalesBackOfficeMenu> {
  final salesMenu = <Map>[
    {
      'id': '1',
      'label': 'Order Penjualan',
      'icon': Icons.shopping_cart_outlined,
      'route': ''
    },
    {
      'id': '2',
      'label': 'Nota / Faktur Penjualan',
      'icon': Icons.request_quote_outlined,
      'route': ''
    },
    {
      'id': '3',
      'label': 'Retur Penjualan',
      'icon': Icons.autorenew_outlined,
      'route': ''
    },
    {
      'id': '4',
      'label': 'Pembayaran Piutang',
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
      children: List.generate(salesMenu.length, (idx) {
        return MenuItem(item: salesMenu[idx]);
      }),
    );
  }
}
