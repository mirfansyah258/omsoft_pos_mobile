import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:omsoft_pos_mobile/config.dart';
import 'package:omsoft_pos_mobile/pages/home/dashboard.dart';
import 'package:omsoft_pos_mobile/pages/purchase/menu.dart';
import 'package:omsoft_pos_mobile/pages/salesBackOffice/menu.dart';
import 'package:omsoft_pos_mobile/pages/salesCashier/menu.dart';
import 'package:omsoft_pos_mobile/pages/settings/menu.dart';
import 'package:omsoft_pos_mobile/pages/stock/menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    SalesCashierMenu(),
    SalesBackOfficeMenu(),
    PurchaseMenu(),
    StockMenu(),
    SettingMenu()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Nav Drawer Main Items
  final menuItem = <Map>[
    {'idx': 0, 'label': 'Dashboard', 'svg': 'dashboard-24.svg', 'route': ''},
    {'idx': 1, 'label': 'Penjualan Kasir', 'svg': 'cart-24.svg', 'route': ''},
    {'idx': 2, 'label': 'Penjualan Back Office', 'svg': 'cart-24.svg', 'route': ''},
    {'idx': 3, 'label': 'Pembelian Stok', 'svg': 'package-24.svg', 'route': ''},
    {'idx': 4, 'label': 'Persediaan', 'svg': 'report-24.svg', 'route': ''},
  ];

  List<Widget> _drawerItem() {
    var widget = <Widget>[
      const ListTile(
        title: Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.w300, color: darkYellow),
        ),
      )
    ];
    for (var i = 0; i < menuItem.length; i++) {
      widget.add(ListTile(
        leading: SvgPicture.asset(
          "assets/svg/${menuItem[i]['svg']}",
          semanticsLabel: menuItem[i]['label']
        ),
        title: Text(
          menuItem[i]['label'],
          style: const TextStyle(fontSize: 16, color: yellow),
        ),
        selected: _selectedIndex == menuItem[i]['idx'],
        onTap: () {
          // Update the state of the app
          _onItemTapped(menuItem[i]['idx']);
          // Then close the drawer
          Navigator.pop(context);
        },
        selectedTileColor: const Color.fromRGBO(133, 182, 255, 0.25),
        shape: const StadiumBorder(),
      ));
    }
    return widget;
  }

  // Nav Drawer Footer Items
  final footerItems = <Map>[
    {'idx': 5, 'label': 'Pengaturan', 'svg': 'setting-24.svg', 'route': ''},
    {'idx': 6, 'label': 'Keluar', 'svg': 'logout-24.svg', 'route': ''},
  ];

  List<Widget> _drawerFooterItem() {
    var widget = <Widget>[
      const Divider(
        height: 0,
        color: yellow,
      )
    ];
    for (var i = 0; i < footerItems.length; i++) {
      widget.add(ListTile(
        leading: SvgPicture.asset(
          "assets/svg/${footerItems[i]['svg']}",
          semanticsLabel: footerItems[i]['label']
        ),
        title: Text(
          footerItems[i]['label'],
          style: const TextStyle(fontSize: 16, color: yellow),
        ),
        selected: _selectedIndex == footerItems[i]['idx'],
        onTap: () {
          // close the drawer
          Navigator.pop(context);
          // Then update the state of the app
          if (i == (footerItems.length - 1)) {
            signOut();
          } else {
            _onItemTapped(footerItems[i]['idx']);
          }
        },
        selectedTileColor: const Color.fromRGBO(133, 182, 255, 0.25),
        shape: const StadiumBorder(),
      ));
    }
    return widget;
  }

  void signOut() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const Text('Are you sure want to sign out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Sign Out'),
            ),
          ],
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        title: const Text(
          'OMSOFT',
          style: TextStyle(
            color: titleYellow,
            fontWeight: FontWeight.w500,
            letterSpacing: 4
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profpic.jpeg'),
            )
          )
        ],
        iconTheme: const IconThemeData(color: titleYellow),
      ),
      drawer: Drawer(
        backgroundColor: darkBlue,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'OMSOFT',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 4,
                        color: yellow
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: yellow,
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: _drawerItem(),
                ),
              ),
              Column(
                children: _drawerFooterItem(),
              )
            ],
          ),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
