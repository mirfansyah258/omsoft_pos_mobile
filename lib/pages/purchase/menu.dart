import 'package:flutter/material.dart';
import 'package:omsoft_pos_mobile/config.dart';

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
        return Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              print('TAP ${purchaseMenu[idx]['label']}');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${purchaseMenu[idx]['label']} Coming Soon'),
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
                    purchaseMenu[idx]['icon'],
                    size: 50,
                    color: darkBlue,
                  ),
                  const SizedBox(height: 10,),
                  Text(
                      purchaseMenu[idx]['label'],
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
