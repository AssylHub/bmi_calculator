import 'package:bmi_calculator1/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/card_inside.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 74;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(197, 5, 9, 33),
      appBar: AppBar(
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: CardInside(
                        cardText: "MALE",
                        cardIcon: FontAwesomeIcons.mars,
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: CardInside(
                        cardText: "FEMALE",
                        cardIcon: FontAwesomeIcons.venus,
                      )),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: labelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: numTextStyle,
                    ),
                    Text(
                      "cm",
                      style: labelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.grey.shade500,
                    thumbColor: Colors.red,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 30),
                    trackHeight: 0.8,
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        // ignore: avoid_print
                        print(newValue.round());
                        height = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
            color: inactiveCardColor,
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "WEIGHT",
                      style: labelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: numTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
                color: inactiveCardColor,
              )),
              Expanded(
                  child: ReusableCard(
                color: inactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AGE",
                      style: labelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: numTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              )),
            ],
          )),
          BottomButton(
            onPressed: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
                
              );

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getDescription(),
                  )));
            print(calc.calculateBMI());
            },
            text: "CALCULATE",
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
