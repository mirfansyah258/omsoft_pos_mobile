import 'package:flutter/material.dart';

class TopProducts extends StatefulWidget {
  const TopProducts({super.key});

  @override
  State<TopProducts> createState() => _TopProductsState();
}

class _TopProductsState extends State<TopProducts> {
  final data = <Map>[
    {'name': 'Apple iPhone 13', 'id': 'Item: #FXZ-4567', 'total': '999'},
    {'name': 'Nike Air Jordan', 'id': 'Item: #FXZ-3456', 'total': '724'},
    {'name': 'Beats Studio 2', 'id': 'Item: #FXZ-9485', 'total': '696'},
    {'name': 'Apple Watch Series 7', 'id': 'Item: #FXZ-2345', 'total': '249'},
    {'name': 'Amazon Echo Dot', 'id': 'Item: #FXZ-8959', 'total': '79'}
  ];

  Widget myItem(idx) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data[idx]['name'], style: TextStyle(fontSize: 16)),
              Text(data[idx]['id'], style: TextStyle(fontStyle: FontStyle.italic),),
            ],
          ),
          Column(
            children: [Text(data[idx]['total'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))],
          ),
        ]),
        SizedBox(height: 5,)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            border: Border.all(
              color: Colors.blue,
              width: 2,
            )),
        child: Padding(
          padding: const EdgeInsets.all(12.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Top 5 Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              ...List.generate(data.length, (idx) {
                return myItem(idx);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
