import 'package:flutter/material.dart';



class BottomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  BottomButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20),),
        color: Colors.red,
        width: double.infinity,
        height: 60,
      ),
    );
  }
}