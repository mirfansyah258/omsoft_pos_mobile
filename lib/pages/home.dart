import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  static const TextStyle optionStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
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
        title: const Text('POS Mobile'),
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout_outlined)
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 28,),
            label: 'Home',
            backgroundColor: darkBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_outlined, size: 28,),
            label: 'Sales',
            backgroundColor: darkBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping_outlined, size: 28,),
            label: 'Purchase',
            backgroundColor: darkBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined, size: 28,),
            label: 'Stock',
            backgroundColor: darkBlue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: yellow,
        selectedFontSize: 16,
        unselectedItemColor: const Color.fromRGBO(133, 182, 255, 1),
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
