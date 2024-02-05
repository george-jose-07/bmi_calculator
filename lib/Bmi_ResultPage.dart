import 'package:flutter/material.dart';

class Bmi_Result extends StatefulWidget {
  Bmi_Result(
      {Key? key, this.height, this.weight, this.age, this.gender, this.clr})
      : super(key: key);
  final String? height;
  final String? weight;
  final String? age;
  final String? gender;
  final String? clr;

  @override
  State<Bmi_Result> createState() => _Bmi_ResultState();
}

class _Bmi_ResultState extends State<Bmi_Result> {
  List<String> BodyNature = [
    'UNDERWEIGHT',
    'NORMAL',
    'OVERWEIGHT',
    'OBESE'
  ];
  List<String> BodyText = [
    'GO EAT YOUR FOOD',
    'YOU ARE PERFECT',
    'GO HIT THE GYM',
    'YOU ARE DEATH'
  ];
  late double Bmi_Value;
  late int Backrgd_clr = int.parse(widget.clr.toString());
  double bmi_calc() {
    var hg = double.parse(widget.height.toString())/100;
    var wg = double.parse(widget.weight.toString());
    Bmi_Value = (wg / (hg * hg));
    return Bmi_Value;
  }

  int Body_Nature() {
    double bmiVal = bmi_calc();
    var _count;
    if (bmiVal < 18.5)
      _count = 0;
    else if (bmiVal >= 18.5 && bmiVal < 25)
      _count = 1;
    else if (bmiVal >= 25 && bmiVal < 30)
      _count = 2;
    else
      _count = 3;
    return _count;
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      dragHandleSize: const Size(50, 5),
      dragHandleColor: Colors.white,
      elevation: 50,
      enableDrag: true,
      showDragHandle: true,
      onDragStart: (details) {
        return Navigator.pop(context);
      },
      onClosing: () {
        Navigator.pop(context);
      },
      backgroundColor: Backrgd_clr == 0 ? Colors.white10 : Colors.white,
      builder: (context) => Container(
        height: 420,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Text(
                BodyNature[Body_Nature()],
                style: TextStyle(
                  color: Backrgd_clr == 0 ? Colors.white : Colors.blue,
                  fontWeight: FontWeight.w900,
                ),
                textScaleFactor: 2.5,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Text(
                BodyText[Body_Nature()],
                style: TextStyle(
                  color: Backrgd_clr == 0 ? Colors.white : Colors.blue,
                  fontWeight: FontWeight.w900,
                ),
                textScaleFactor: 1.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BMI : ",
                    style: TextStyle(
                      color: Backrgd_clr == 0 ? Colors.white : Colors.blue,
                      fontWeight: FontWeight.w900,
                    ),
                    textScaleFactor: 2.5,
                    maxLines: 1,
                  ),
                  Text(
                    bmi_calc().toStringAsFixed(2),
                    style: TextStyle(
                      color: Backrgd_clr == 0 ? Colors.white : Colors.blue,
                      fontWeight: FontWeight.w900,
                    ),
                    textScaleFactor: 2.5,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  //color: Backrgd_clr == 0 ? Colors.red : Colors.blue,
                  gradient:  RadialGradient(
                      colors: Backrgd_clr==0?<Color>[
                        Colors.red,
                        Colors.deepOrange,
                        Colors.white
                      ]:<Color>[
                        Colors.blue,
                        Colors.lightBlue,
                        Colors.white
                      ],
                      radius: 1.5,
                      center: Alignment.center,
                      tileMode: TileMode.clamp),
                  boxShadow: [
                    BoxShadow(
                        color: Backrgd_clr == 0 ? Colors.white : Colors.black,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 0.1,
                        blurRadius: 3,
                        offset: Offset(0, 0))
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
                        const Text("WEIGHT : ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textScaleFactor: 1.3),
                        Text(widget.weight.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textScaleFactor: 1.3),
                        const Text(" KG",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textScaleFactor: 1.3),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("HEIGHT : ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textScaleFactor: 1.3),
                        Text(widget.height.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textScaleFactor: 1.3),
                        const Text(" M",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textScaleFactor: 1.3),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("AGE : ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textScaleFactor: 1.3),
                        Text(widget.age.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textScaleFactor: 1.3),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("GENDER : ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textScaleFactor: 1.3),
                        Text(widget.gender!.toUpperCase().toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textScaleFactor: 1.3),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
