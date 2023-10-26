import 'package:flutter/material.dart';
import 'package:omsoft_pos_mobile/config.dart';

class StockHistory extends StatefulWidget {
  const StockHistory({super.key});

  @override
  State<StockHistory> createState() => _StockHistoryState();
}

class _StockHistoryState extends State<StockHistory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Stock History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: darkBlue,
              ),
            ),
            GestureDetector(
              onTap: () {
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 49, 122, .15),
                  borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                child: const Text(
                  'See More',
                  style: TextStyle(
                    fontSize: 12,
                    color: darkBlue
                  ),
                ),
              )
            )
          ],
        ),
        const SizedBox(height: 16,),
        Container(
          
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color.fromRGBO(133, 182, 255, 1),
            ),
            borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('assets/images/product-1.jpg')
              ),
              const SizedBox(width: 8,),
              Expanded(
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.all(8),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Love Corn',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: darkBlue
                            ),
                          ),
                          Text(
                            'Stock Out',
                            style: TextStyle(
                              fontSize: 12,
                              color: red
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '24pcs',
                            style: TextStyle(
                              fontSize: 16,
                              color: red
                            ),
                          ),
                          Text(
                            'Rp. 12.000/pcs',
                            style: TextStyle(
                              color: darkBlue
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              )
            ],
          ),
        )
      ],
    );
  }
}