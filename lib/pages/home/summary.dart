import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omsoft_pos_mobile/config.dart';

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Summary',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: darkBlue,
          ),
        ),
        const SizedBox(height: 16,),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(0, 45, 114, 1),
                Color.fromRGBO(0, 74, 184, 0.6),
              ],
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Income Today',
                style: TextStyle(
                  color: grey
                ),
              ),
              const SizedBox(height: 16,),
              const Text(
                'Rp. 321.000',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: titleYellow
                ),
              ),
              const SizedBox(height: 16,),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: green,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/trend-up-24.svg",
                      semanticsLabel: 'Stonk'
                    ),
                    const SizedBox(width: 8,),
                    const Text(
                      '+5%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8,),
              const Text(
                'Than Yesterday',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: green
                ),
              )
            ]
          ),
        )
      ],
    );
  }
}