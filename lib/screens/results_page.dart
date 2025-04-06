import 'package:bmi_calculator1/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(197, 5, 9, 33),
      appBar: AppBar(
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Your results",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
              child: ReusableCard(
            color: const Color.fromARGB(197, 39, 44, 70),
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  resultText,
                  style: TextStyle(color: Colors.green, fontSize: 23, fontWeight: FontWeight.w700),
                ),
                Text(
                  bmiResult,
                  style: TextStyle(color: Colors.white, fontSize: 100, fontWeight: FontWeight.w700),
                ),
                Text(interpretation, textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
          )),
          BottomButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage()));

          }, text: "RECALCULATE"),
        ],
      ),
    );
  }
}
