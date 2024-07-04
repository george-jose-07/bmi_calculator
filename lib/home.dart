import 'package:bmi_calculator/bmi_result_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  Gender _selectedSegment = Gender.male;

  TextEditingController heightTextController = TextEditingController();
  TextEditingController weightTextController = TextEditingController();
  TextEditingController ageTextController = TextEditingController();

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
                padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
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
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
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
                        horizontal: 10, vertical:10),
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
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
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
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showModalBottomSheet(
                        useSafeArea: true,
                        isScrollControlled: true,
                        elevation: 100,showDragHandle: true,
                        context: context,
                        builder: (context) => SizedBox(
                          height: 400,
                          child: BmiResult(
                            height: heightTextController.text,
                            weight: weightTextController.text,
                            age: ageTextController.text,
                            gender: _selectedSegment.name,
                          ),
                        ),
                      );
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
