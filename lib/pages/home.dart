import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:omsoft_pos_mobile/config.dart';
import 'package:omsoft_pos_mobile/pages/home/dashboard.dart';
import 'package:omsoft_pos_mobile/pages/purchase/menu.dart';
import 'package:omsoft_pos_mobile/pages/sales/menu.dart';
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
    SalesMenu(),
    PurchaseMenu(),
    StockMenu(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void signOut () {
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
      }
    );
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
            onPressed: signOut,
            icon: const Icon(Icons.logout_outlined),
          )
        ],
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(24),
        //   ),
        // ),
        iconTheme: const IconThemeData(color: titleYellow),
      ),
      drawer: Drawer(
        backgroundColor: darkBlue,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  children: [
                    const ListTile(
                      title: Text(
                        'Menu',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: darkYellow
                        ),
                      ),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/svg/dashboard-24.svg',
                        semanticsLabel: 'Dashboard'
                      ),
                      title: const Text(
                        'Dashboard',
                        style: TextStyle(
                          fontSize: 16,
                          color: yellow
                        ),
                      ),
                      selected: _selectedIndex == 0,
                      onTap: () {
                        // Update the state of the app
                        _onItemTapped(0);
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                      selectedTileColor: Color.fromRGBO(133, 182, 255, 0.25),
                      shape: StadiumBorder(),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/svg/cart-24.svg',
                        semanticsLabel: 'Cashier'
                      ),
                      title: const Text(
                        'Cashier',
                        style: TextStyle(
                          fontSize: 16,
                          color: yellow
                        ),
                      ),
                      selected: _selectedIndex == 1,
                      onTap: () {
                        // Update the state of the app
                        _onItemTapped(1);
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                      selectedTileColor: Color.fromRGBO(133, 182, 255, 0.25),
                      shape: StadiumBorder(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
