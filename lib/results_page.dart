import 'package:flutter/material.dart';
import 'card_element.dart';
import 'constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({
    required this.bmiCalculation,
    required this.resultString,
    required this.interpretationString,
    required this.resultTextColour,
  });

  final double bmiCalculation;
  final String resultString;
  final String interpretationString;
  final Color resultTextColour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YOUR BMI RESULTS',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CardElement(
              cardChild: Column(
//                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                        child: Text(
                          resultString,
                          style:TextStyle(
                            color: resultTextColour,
                            fontSize: 22.0,
                          ),
                        ),
//                        margin: EdgeInsets.only(top:10.0),
                      ),
                    ],
                  ),
                  SizedBox(width: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 10,
                              maximum: 40,
                              axisLineStyle: AxisLineStyle(
                                thickness: 32,
//                                thicknessUnit: GaugeSizeUnit.factor,
                                  gradient: const SweepGradient(
                                    colors: <Color>[Color(0xFF0000FF), Color(0xFF00FF00), Color(0xFFFF0000)],
                                    stops: <double>[0.20, 0.5, 0.80]
                                  ),
                                  cornerStyle:CornerStyle.bothCurve
                                ),
/*                              ranges: <GaugeRange>[
                                GaugeRange(startValue: 0, endValue: 50, startWidth: 32, endWidth: 32, color: Color(0x4F0000FF)),
                                GaugeRange(startValue: 50,endValue: 100, startWidth: 32, endWidth: 32, color: Color(0x4F00FF00)),
                                GaugeRange(startValue: 100,endValue: 150, startWidth: 32, endWidth: 32, color: Color(0x4FFF0000)),
                              ],
*/                              pointers: <GaugePointer>[
                                NeedlePointer(value: bmiCalculation.toDouble(),),],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(widget:
                                Container(
                                    child:
                                      Text(
                                          bmiCalculation.toStringAsFixed(1),
                                          style: kBMIScoreStyle,
                                      ),
                                ),
                                angle: 90, positionFactor: 0.5
                                ),
                              ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 10.0,),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                          child: Text(
                            interpretationString,
                            textAlign: TextAlign.center,
                            style: kInterpretationStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
