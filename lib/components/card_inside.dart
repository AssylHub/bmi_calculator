import 'package:flutter/material.dart';
import '../constants.dart';


class CardInside extends StatelessWidget {
  final String? cardText;
  final IconData? cardIcon;

  CardInside({required this.cardText, required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            cardIcon,
            size: 80,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '$cardText',
            style: labelTextStyle,
          ),
        ]);
  }
}