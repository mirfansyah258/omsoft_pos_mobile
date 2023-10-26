import 'package:flutter/material.dart';
import 'package:omsoft_pos_mobile/components/MenuItem.dart';
import 'package:omsoft_pos_mobile/config.dart';

class SalesCashierMenu extends StatefulWidget {
  const SalesCashierMenu({super.key});

  @override
  State<SalesCashierMenu> createState() => _SalesCashierMenuState();
}

class _SalesCashierMenuState extends State<SalesCashierMenu> {
  final salesMenu = <Map>[
    {
      'id': '1',
      'label': 'Penjualan Kasir',
      'icon': Icons.storefront_outlined,
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