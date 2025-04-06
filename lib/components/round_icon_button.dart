import 'package:flutter/material.dart';
import '../constants.dart';
import '';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  // int action;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(width: 56, height: 56),
      fillColor: activeCardColor,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}