import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bmi_calculator/main.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.bmi}) : super(key: key);

  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBG,
      appBar: AppBar(
          backgroundColor: kBG,
          title: Text(
            'BMI Calculator',
            style: kBodyTextStyle,
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  'YOUR BMI IS',
                  style: kResultTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  bmi,
                  style: kBMITextStyle,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 80,
                color: kBottomContainerColor,
                child: Center(
                    child: Text(
                  'RECALCULATE MY BMI',
                  style: kLargeButtonTextStyle,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
