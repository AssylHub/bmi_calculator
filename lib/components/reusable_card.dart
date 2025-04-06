import 'package:flutter/material.dart';



class ReusableCard extends StatelessWidget {
  final Color? color;
  final Widget? cardChild;
  final GestureTapCallback? onPress;

  const ReusableCard({required this.color, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
