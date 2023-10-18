import 'package:flutter/material.dart';
import 'package:omsoft_pos_mobile/config.dart';

class MyLineChart extends StatefulWidget {
  const MyLineChart({super.key});

  @override
  State<MyLineChart> createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  late PageController _pageController;

  Widget myCardItem(item) {
    return Container(
      decoration: BoxDecoration(
        color: bgBoxBlue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.abc),
          Expanded(
            child: Column(
              children: [
                Text(item['label']),
                Text(item['value']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Map> myData = [
    {
      'label': 'Sales',
      'value': '1'
    },
    {
      'label': 'Customers',
      'value': '1'
    },
    {
      'label': 'Products',
      'value': '1'
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
          itemCount: 3,
          pageSnapping: true,
          controller: _pageController,
          // onPageChanged: (page) {
          //   setState(() {
          //     activePage = page;
          //   });
          // },
          itemBuilder: (context, pagePosition) {
            return Container(
              margin: EdgeInsets.all(10),
              child: myCardItem(myData[pagePosition])
            );
          }),
    );
  }
}
