import 'package:bmi_calculator/bmi_result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

enum Gender { male, female }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  Gender _selectedSegment = Gender.male;
  List<String> bodyNature = ['UNDERWEIGHT', 'NORMAL', 'OVERWEIGHT', 'OBESE'];
  TextEditingController heightTextController = TextEditingController();
  TextEditingController weightTextController = TextEditingController();
  TextEditingController ageTextController = TextEditingController();

  double bmiCalc(String height, String weight) {
    double hg = double.parse(height) / 100;
    double wg = double.parse(weight);
    return (wg / (hg * hg));
  }

  int bodyType() {
    double bmiVal =
        bmiCalc(heightTextController.text, weightTextController.text);
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
  void dispose() {
    heightTextController.dispose();
    weightTextController.dispose();
    ageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
                child: Text("BMI CALCULATOR",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 2)
                    .animate(onPlay: (controller) => controller.repeat())
                    .shimmer(
                      duration: 3000.ms,
                      delay: 1000.ms,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                child: SizedBox(
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoSlidingSegmentedControl(
                    children: <Gender, Widget>{
                      Gender.male: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 30),
                        child: Column(
                          children: [
                            Text(
                              'MALE',
                              style: GoogleFonts.bebasNeue(
                                fontSize: 20,
                              ),
                              textScaleFactor: 1.5,
                            ),
                            const Icon(
                              Icons.male,
                              size: 35,
                            )
                          ],
                        ),
                      ),
                      Gender.female: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 30),
                        child: Column(
                          children: [
                            Text('FEMALE',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 20,
                                ),
                                textScaleFactor: 1.5),
                            const Icon(
                              Icons.female,
                              size: 35,
                            )
                          ],
                        ),
                      ),
                    },
                    // backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    groupValue: _selectedSegment,
                    onValueChanged: (value) {
                      setState(() {
                        _selectedSegment = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  controller: heightTextController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Enter Your Height in centimeter",
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'please enter height';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  controller: weightTextController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Enter Your Weight in kilogram",
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'please enter weight';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 20, bottom: 20),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  controller: ageTextController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Enter Your Age",
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'please enter Age';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: BmiResult(
                            bmi: Bmi(
                              age: ageTextController.text,
                              height: heightTextController.text,
                              weight: weightTextController.text,
                              date: DateTime.now(),
                              bmiValue: bmiCalc(heightTextController.text,
                                  weightTextController.text),
                              gender: _selectedSegment.name,
                              bodyNature: bodyNature[bodyType()],
                            ),
                          ),
                        ),
                      );
                      // showModalBottomSheet(
                      //   useSafeArea: true,
                      //   isScrollControlled: true,
                      //   enableDrag: true,
                      //   elevation: 100,
                      //   showDragHandle: true,
                      //   context: context,
                      //   builder: (context) => SizedBox(
                      //     height: 400,
                      //     child: BmiResult(
                      //       bmi: Bmi(
                      //         age: ageTextController.text,
                      //         height: heightTextController.text,
                      //         weight: weightTextController.text,
                      //         date: DateTime.now(),
                      //         bmiValue: bmiCalc(heightTextController.text,
                      //             weightTextController.text),
                      //         gender: _selectedSegment.name,
                      //         bodyNature: bodyNature[bodyType()],
                      //       ),
                      //       // height: heightTextController.text,
                      //       // weight: weightTextController.text,
                      //       // age: ageTextController.text,
                      //       // gender: _selectedSegment.name,
                      //     ),
                      //   ),
                      // );
                    }
                  },
                  child: const Text("ENTER"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
