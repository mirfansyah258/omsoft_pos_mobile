import 'package:flutter/material.dart';
import 'package:omsoft_pos_mobile/pages/home/lineChart.dart';
import 'package:omsoft_pos_mobile/pages/home/stockHistory.dart';
import 'package:omsoft_pos_mobile/pages/home/summary.dart';
import 'package:omsoft_pos_mobile/pages/home/topProducts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const <Widget>[
        // TopProducts()
        Summary(),
        SizedBox(height: 32,),
        StockHistory(),
      ],
    );
  }
}
