import 'dart:ui';

import 'package:bmi_calculator/bmi_model.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatefulWidget {
  const BmiResult({super.key, required this.bmi});
  final BmiModel bmi;

  @override
  State<BmiResult> createState() => BmiResultState();
}

class BmiResultState extends State<BmiResult> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    return width > 600
        ? Container(
            decoration: BoxDecoration(
              // gradient: const LinearGradient(
              //     colors: [Color(0xff83a4d4), Color(0xffb6fbff)]),
              image: DecorationImage(
                  image: AssetImage('assets/images/dark.jpg'),
                  fit: BoxFit.cover,
                  invertColors: isDarkMode ? false : true,
                  opacity: 1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color:
                    isDarkMode ? Colors.white : Colors.black.withOpacity(0.7),
              ),
            ),
            height: 220,
            width: 550,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Text(
                        widget.bmi.bodyNature,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                        maxLines: 1,
                      ),
                    ),
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
                            widget.bmi.bmiValue.toStringAsFixed(2),
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                            textScaleFactor: 2.5,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 20, bottom: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 55,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.7),
                                ),
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(colors: [
                                  Color(0xff83a4d4).withOpacity(0.4),
                                  Color(0xffb6fbff).withOpacity(0.4)
                                ]),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                                  child: const Center(
                                    child: Text(
                                      'OKAY',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isDarkMode
                              ? Colors.white
                              : Colors.black.withOpacity(0.7),
                        ),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Color(0xff83a4d4).withOpacity(0.4),
                          Color(0xffb6fbff).withOpacity(0.4)
                        ]),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 20, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("WEIGHT : ",
                                        textScaleFactor: 1.3),
                                    Text(widget.bmi.weight.toString(),
                                        textScaleFactor: 1.3),
                                    const Text(" KG", textScaleFactor: 1.3),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("HEIGHT : ",
                                        textScaleFactor: 1.3),
                                    Text(widget.bmi.height.toString(),
                                        textScaleFactor: 1.3),
                                    const Text(" M", textScaleFactor: 1.3),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("AGE : ", textScaleFactor: 1.3),
                                    Text(widget.bmi.age.toString(),
                                        textScaleFactor: 1.3),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 5, bottom: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("GENDER : ",
                                        textScaleFactor: 1.3),
                                    Text(widget.bmi.gender.toUpperCase(),
                                        textScaleFactor: 1.3),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
              // gradient: const LinearGradient(
              //     colors: [Color(0xff83a4d4), Color(0xffb6fbff)]),
              image: DecorationImage(
                  image: AssetImage('assets/images/dark.jpg'),
                  fit: BoxFit.cover,
                  invertColors: isDarkMode ? false : true,
                  opacity: 1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color:
                    isDarkMode ? Colors.white : Colors.black.withOpacity(0.7),
              ),
            ),
            height: 380,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Text(
                    widget.bmi.bodyNature,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                    ),
                    maxLines: 1,
                  ),
                ),
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
                          widget.bmi.bmiValue.toStringAsFixed(2),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                          textScaleFactor: 2.5,
                          maxLines: 1,
                        ),
                      ],
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isDarkMode
                            ? Colors.white
                            : Colors.black.withOpacity(0.7),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color(0xff83a4d4).withOpacity(0.4),
                        Color(0xffb6fbff).withOpacity(0.4)
                      ]),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 20, bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("WEIGHT : ", textScaleFactor: 1.3),
                                  Text(widget.bmi.weight.toString(),
                                      textScaleFactor: 1.3),
                                  const Text(" KG", textScaleFactor: 1.3),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("HEIGHT : ", textScaleFactor: 1.3),
                                  Text(widget.bmi.height.toString(),
                                      textScaleFactor: 1.3),
                                  const Text(" M", textScaleFactor: 1.3),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("AGE : ", textScaleFactor: 1.3),
                                  Text(widget.bmi.age.toString(),
                                      textScaleFactor: 1.3),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 5, bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("GENDER : ", textScaleFactor: 1.3),
                                  Text(widget.bmi.gender.toUpperCase(),
                                      textScaleFactor: 1.3),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 9, right: 20, bottom: 20),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 55,
                          width: 110,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isDarkMode
                                  ? Colors.white
                                  : Colors.black.withOpacity(0.7),
                            ),
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [
                              Color(0xff83a4d4).withOpacity(0.4),
                              Color(0xffb6fbff).withOpacity(0.4)
                            ]),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                              child: const Center(
                                child: Text(
                                  'OKAY',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
