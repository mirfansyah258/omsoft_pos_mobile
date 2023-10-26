import 'package:flutter/material.dart';
import 'package:omsoft_pos_mobile/components/MenuItem.dart';
import 'package:omsoft_pos_mobile/config.dart';

class StockMenu extends StatefulWidget {
  const StockMenu({super.key});

  @override
  State<StockMenu> createState() => _StockMenuState();
}

class _StockMenuState extends State<StockMenu> {
  final stockMenu = <Map>[
    {
      'id': '1',
      'label': 'Stok Masuk Lain-Lain',
      'icon': Icons.input_outlined,
      'route': ''
    },
    {
      'id': '2',
      'label': 'Stok Keluar Lain-Lain',
      'icon': Icons.output_outlined,
      'route': ''
    },
    {
      'id': '3',
      'label': 'Mutasi Barang',
      'icon': Icons.move_up_outlined,
      'route': ''
    },
    {
      'id': '4',
      'label': 'Stok Opname',
      'icon': Icons.checklist_rtl_outlined,
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
      children: List.generate(stockMenu.length, (idx) {
        return MenuItem(item: stockMenu[idx]);
      }),
    );
  }
}
