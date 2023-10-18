import 'package:flutter/material.dart';
import 'package:omsoft_pos_mobile/config.dart';

class MenuItem extends StatefulWidget {
  final item;
  
  const MenuItem({
    super.key,
    required this.item,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${widget.item['label']} Coming Soon'),
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.item['icon'],
                size: 50,
                color: darkBlue,
              ),
              const SizedBox(height: 10,),
              Text(
                widget.item['label'],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, color: darkBlue)
              ),
            ],
          ),
        ),
      ),
    );
  }
}