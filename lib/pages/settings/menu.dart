import 'package:flutter/material.dart';

class SettingMenu extends StatefulWidget {
  const SettingMenu({super.key});

  @override
  State<SettingMenu> createState() => _SettingMenuState();
}

class _SettingMenuState extends State<SettingMenu> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings', style: TextStyle(fontSize: 24),),
    );
  }
}