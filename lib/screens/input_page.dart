import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/round_icon_buton.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 60;
  int weight = 170;
  int age = 40;

//  Color maleCardColour = inactiveCardColour;
//  Color femaleCardColour = inactiveCardColour;

//  void updateColour(Gender selectedGender) {j
//    //male card pressed
//    if (selectedGender == Gender.male) {
//      if (maleCardColour == inactiveCardColour) {
//        maleCardColour = activeCardColour;
//        femaleCardColour = inactiveCardColour;
//      } else {
//        maleCardColour = inactiveCardColour;
//      }
//    } else if (selectedGender == Gender.female) {
//      if (femaleCardColour == inactiveCardColour) {
//        femaleCardColour = activeCardColour;
//        maleCardColour = inactiveCardColour;
//      } else {
//        femaleCardColour = inactiveCardColour;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMIX CALCULATOR',
            style: GoogleFonts.aclonica(
              textStyle: kLabelTextStyle,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCardXD(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: IconContent(
                    icon: (FontAwesomeIcons.mars),
                    label: ('MALE'),
                  ),
                ),
              ),
              Expanded(
                child: ReusableCardXD(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: IconContent(
                    icon: (FontAwesomeIcons.venus),
                    label: ('FEMALE'),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCardXD(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    //height.toString(),
                    'HEIGHT',
                    style: GoogleFonts.aclonica(
                      textStyle: kLabelTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: GoogleFonts.aclonica(
                          textStyle: kSliderTextStyle,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'in',
                        style: GoogleFonts.aclonica(
                          textStyle: kLabelTextStyle,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x52EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 30.0,
                      max: 108.0,
                      onChanged: (double newValue) {
//                          print(newValue);
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCardXD(
                    colour: kActiveCardColour,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: GoogleFonts.aclonica(
                              textStyle: kLabelTextStyle,
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  weight.toString(),
                                  style: GoogleFonts.aclonica(
                                    textStyle: kSliderTextStyle,
                                  ),
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  'lb',
                                  style: GoogleFonts.aclonica(
                                    textStyle: kLabelTextStyle,
                                  ),
                                ),
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ],
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  child: ReusableCardXD(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: GoogleFonts.aclonica(
                            textStyle: kLabelTextStyle,
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                age.toString(),
                                style: GoogleFonts.aclonica(
                                  textStyle: kSliderTextStyle,
                                ),
                              ),
                              SizedBox(width: 5.0),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
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
            buttonTitle: 'CALCULATE',
            onTap: () {

             CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(context,
              MaterialPageRoute(
                builder:(context) => ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
             ),
              ),
              );
            },
          ),
        ],
      ),
    );
  }
}



