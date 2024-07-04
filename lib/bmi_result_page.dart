import 'package:flutter/material.dart';

class BmiResult extends StatefulWidget {
  const BmiResult({
    super.key,
    this.height,
    this.weight,
    this.age,
    this.gender,
  });
  final String? height;
  final String? weight;
  final String? age;
  final String? gender;

  @override
  State<BmiResult> createState() => BmiResultState();
}

class BmiResultState extends State<BmiResult> {
  List<String> bodyNature = ['UNDERWEIGHT', 'NORMAL', 'OVERWEIGHT', 'OBESE'];
  List<String> bodyText = [
    'GO EAT YOUR FOOD',
    'YOU ARE PERFECT',
    'GO HIT THE GYM',
    'GO TO GYM ASAP'
  ];
  late double bmiValue;
  double bmiCalc() {
    var hg = double.parse(widget.height.toString()) / 100;
    var wg = double.parse(widget.weight.toString());
    bmiValue = (wg / (hg * hg));
    return bmiValue;
  }

  int bodyType() {
    double bmiVal = bmiCalc();
    int count;
    if (bmiVal < 18.5) {
      count = 0;
    } else if (bmiVal >= 18.5 && bmiVal < 25) {
      count = 1;
    } else if (bmiVal >= 25 && bmiVal < 30) {
      count = 2;
    } else {
      count = 3;
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > 600 ?
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Text(
                      bodyNature[bodyType()],
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                      textScaleFactor: 2.5,
                      maxLines: 1,
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Text(
                      bodyText[bodyType()],
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                      textScaleFactor: 1.3,
                    )),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "BMI : ",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                          textScaleFactor: 2.5,
                          maxLines: 1,
                        ),
                        Text(
                          bmiCalc().toStringAsFixed(2),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                          textScaleFactor: 2.5,
                          maxLines: 1,
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 0.3,
                        blurRadius: 5,
                        offset: Offset(0, 0),
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 40, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("WEIGHT : ", textScaleFactor: 1.3),
                          Text(widget.weight.toString(), textScaleFactor: 1.3),
                          const Text(" KG", textScaleFactor: 1.3),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("HEIGHT : ", textScaleFactor: 1.3),
                          Text(widget.height.toString(), textScaleFactor: 1.3),
                          const Text(" M", textScaleFactor: 1.3),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("AGE : ", textScaleFactor: 1.3),
                          Text(widget.age.toString(), textScaleFactor: 1.3),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("GENDER : ", textScaleFactor: 1.3),
                          Text(widget.gender!.toUpperCase().toString(),
                              textScaleFactor: 1.3),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )
      :Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  bodyNature[bodyType()],
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                  textScaleFactor: 2.5,
                  maxLines: 1,
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Text(
                  bodyText[bodyType()],
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                  textScaleFactor: 1.3,
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "BMI : ",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                      textScaleFactor: 2.5,
                      maxLines: 1,
                    ),
                    Text(
                      bmiCalc().toStringAsFixed(2),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                      textScaleFactor: 2.5,
                      maxLines: 1,
                    ),
                  ],
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 0.3,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 40, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("WEIGHT : ", textScaleFactor: 1.3),
                      Text(widget.weight.toString(), textScaleFactor: 1.3),
                      const Text(" KG", textScaleFactor: 1.3),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("HEIGHT : ", textScaleFactor: 1.3),
                      Text(widget.height.toString(), textScaleFactor: 1.3),
                      const Text(" M", textScaleFactor: 1.3),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("AGE : ", textScaleFactor: 1.3),
                      Text(widget.age.toString(), textScaleFactor: 1.3),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("GENDER : ", textScaleFactor: 1.3),
                      Text(widget.gender!.toUpperCase().toString(),
                          textScaleFactor: 1.3),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
