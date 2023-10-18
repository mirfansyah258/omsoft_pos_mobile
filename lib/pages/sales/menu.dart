import 'package:flutter/material.dart';
import 'package:omsoft_pos_mobile/config.dart';

class SalesMenu extends StatefulWidget {
  const SalesMenu({super.key});

  @override
  State<SalesMenu> createState() => _SalesMenuState();
}

class _SalesMenuState extends State<SalesMenu> {
  final salesMenu = <Map>[
    {
      'id': '1',
      'label': 'Penjualan Kasir',
      'icon': Icons.storefront_outlined,
      'route': ''
    },
    {
      'id': '2',
      'label': 'Order Penjualan',
      'icon': Icons.shopping_cart_outlined,
      'route': ''
    },
    {
      'id': '3',
      'label': 'Nota / Faktur Penjualan',
      'icon': Icons.request_quote_outlined,
      'route': ''
    },
    {
      'id': '4',
      'label': 'Retur Penjualan',
      'icon': Icons.keyboard_return_outlined,
      'route': ''
    },
    {
      'id': '5',
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
      children: List.generate(5, (idx) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              print('TAP ${salesMenu[idx]['label']}');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${salesMenu[idx]['label']} Coming Soon'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: bgBoxBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    salesMenu[idx]['icon'],
                    size: 50,
                    color: darkBlue,
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    salesMenu[idx]['label'],
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 15,
                      color: darkBlue
                    )
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
