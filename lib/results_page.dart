import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatelessWidget {
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
        children: <Widget>[
          Expanded(
            child: Text(
              'Hello Results',
              style: GoogleFonts.aclonica(
                textStyle: kLargeButtonTextStyle,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Container(
              child: Center(
                child: Text(
                  'Re-Calculate',
                  style: GoogleFonts.simonetta(
                    textStyle: kSliderTextStyle,
                  ),
                ),
              ),
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}
