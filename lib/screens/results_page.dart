import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMIX CALCULATOR',
          style: GoogleFonts.aclonica(
            textStyle: kLabelTextStyle,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Your Results',
                  style: GoogleFonts.simonetta(
                    textStyle: kLargeButtonTextStyle,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCardXD(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    interpretation,
                    style: GoogleFonts.aclonica(
                      textStyle: kResultsTextStyle,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: GoogleFonts.aclonica(
                      textStyle: kBMIResultNumberStyle,
                    ),
                  ),
                  Text(
                    resultText,
                    style: GoogleFonts.simonetta(
                      textStyle: kLabelTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
            Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
