import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_content.dart';
import 'card_element.dart';
import 'rounded_icon_button.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender {male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedCard = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: CardElement(
                      onPress: (){
                        setState(() {
                          selectedCard = Gender.male;
                        });
                      },
                      colour: Color(selectedCard==Gender.male ? kActiveCardColour:kInactiveCardColour),
                      cardChild: CardContent(
                        icon: FontAwesomeIcons.mars,
                        iconText: "MALE",
                      ),
                    ),
                  ),
                Expanded(
                    child: CardElement(
                      onPress: () {
                        setState(() {
                          selectedCard = Gender.female;
                        });
                      },
                      colour: Color(selectedCard==Gender.female ? kActiveCardColour:kInactiveCardColour),
                      cardChild: CardContent(
                        icon: FontAwesomeIcons.venus,
                        iconText: "FEMALE",
                      ),
                    ),
                  ),
                ],
                ),
            ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: CardElement(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('HEIGHT', style: kLabelTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: kNumberStyle,
                              ),
                              Text('cm', style: kLabelTextStyle,),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                              activeTrackColor: Color(kButtonColour),
//                              thumbColor: Colors.grey,
                            ),
                            child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                onChanged: (double newValue){
                                  setState(() {
                                    height = newValue.toInt();
                                  });
                                },
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: CardElement(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT', style: kLabelTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: kNumberStyle,
                              ),
                              Text('kg', style: kLabelTextStyle,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                iconData: FontAwesomeIcons.minus,
                              ),
                              SizedBox(width: 10.0,),
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                iconData: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ),
                Expanded(
                  child: CardElement(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kLabelTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: kNumberStyle,
                            ),
                            Text('yrs', style: kLabelTextStyle,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                              iconData: FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                              iconData: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
              );
              Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiCalculation: calc.calculateBMI(),
                    resultString: calc.getResult(),
                    interpretationString: calc.getInterpretation(),
                    resultTextColour: calc.getResultColour(),
                  ),
                ),
              );
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}




