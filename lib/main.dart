import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'package:bmi_calculator/result_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var gender = Gender.other;
  var age = 20;
  var height = 150;
  var weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBG,
      appBar: AppBar(
        backgroundColor: kBG,
        title: Text(
          'BMI Calculator',
          style: kBodyTextStyle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: CardWidget(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 100,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'MALE',
                            style: kBodyTextStyle,
                          )
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                      color: gender == Gender.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                    )),
                Expanded(
                    child: CardWidget(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 100,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'FEMALE',
                            style: kBodyTextStyle,
                          )
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          gender = Gender.female;
                        });
                      },
                      color: gender == Gender.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                    )),
              ],
            ),
          ),
          Expanded(
              child: CardWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kBodyTextStyle,
                    ),
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Slider(
                        min: 130,
                        max: 220,
                        activeColor: kBottomContainerColor,
                        value: height.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            height = value.toInt();
                          });
                        })
                  ],
                ),
                onTap: () {},
                color: kInActiveCardColor,
              )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: CardWidget(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kBodyTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.plus),
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                    height: 56.0, width: 56.0),
                                elevation: 5,
                                fillColor: kActiveCardColor,
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.minus),
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                    height: 56.0, width: 56.0),
                                elevation: 5,
                                fillColor: kActiveCardColor,
                              )
                            ],
                          )
                        ],
                      ),
                      onTap: () {},
                      color: kInActiveCardColor,
                    )),
                Expanded(
                    child: CardWidget(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kBodyTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.plus),
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                    height: 56.0, width: 56.0),
                                elevation: 5,
                                fillColor: kActiveCardColor,
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.minus),
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                    height: 56.0, width: 56.0),
                                elevation: 5,
                                fillColor: kActiveCardColor,
                              )
                            ],
                          )
                        ],
                      ),
                      onTap: () {},
                      color: kInActiveCardColor,
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              final hg = height/100;
              final res = weight / (hg * hg);

              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ResultPage(bmi: res.round().toString(),)));
            },
            child: Container(
              height: 80,
              color: kBottomContainerColor,
              child: Center(
                  child: Text(
                    'CALCULATE MY BMI',
                    style: kLargeButtonTextStyle,
                  )),
            ),
          )
        ],
      ),
    );
  }
}

enum Gender { other, male, female }

class CardWidget extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;

  const CardWidget({required this.child,
    this.color = kInActiveCardColor,
    required this.onTap,
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
