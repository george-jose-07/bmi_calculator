import 'dart:ui';

import 'package:bmi_calculator/bmi_model.dart';
import 'package:bmi_calculator/bmi_result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

enum Gender { male, female }

class AddBmi extends StatefulWidget {
  const AddBmi({super.key, required this.onAddBmi});
  final void Function(BmiModel bmi) onAddBmi;

  @override
  State<AddBmi> createState() => _AddBmiState();
}

class _AddBmiState extends State<AddBmi> {
  List<String> bodyNature = ['UNDERWEIGHT', 'NORMAL', 'OVERWEIGHT', 'OBESE'];
  double height = 0;
  double weight = 0;
  int age = 0;
  Gender _selectedSegment = Gender.male;

  double bmiCalc(double height, double weight) {
    double hg = height / 100;
    double wg = weight;
    return (wg / (hg * hg));
  }

  int bodyType() {
    double bmiVal = bmiCalc(height, weight);
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
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: SizedBox(
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: CupertinoSlidingSegmentedControl(
                thumbColor: Colors.transparent,
                children: <Gender, Widget>{
                  Gender.male: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(25),
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: _selectedSegment == Gender.male
                              ? LinearGradient(colors: [
                                  Color(0xff83a4d4).withOpacity(0.8),
                                  Color(0xffb6fbff).withOpacity(0.8)
                                ])
                              : LinearGradient(colors: [
                                  Color(0xff83a4d4).withOpacity(0.4),
                                  Color(0xffb6fbff).withOpacity(0.4)
                                ]),
                          // color: _selectedSegment == Gender.male
                          //     ? Colors.blue.withOpacity(0.5)
                          //     : Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isDarkMode
                                ? Colors.white
                                : Colors.black.withOpacity(0.7),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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
                    ),
                  ),
                  Gender.female: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.all(25),
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: _selectedSegment == Gender.female
                              ? LinearGradient(colors: [
                                  Color(0xff83a4d4).withOpacity(0.8),
                                  Color(0xffb6fbff).withOpacity(0.8)
                                ])
                              : LinearGradient(colors: [
                                  Color(0xff83a4d4).withOpacity(0.4),
                                  Color(0xffb6fbff).withOpacity(0.4)
                                ]),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isDarkMode
                                ? Colors.white
                                : Colors.black.withOpacity(0.7),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text('FEMALE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                textScaleFactor: 1.5),
                            const Icon(
                              Icons.female,
                              size: 35,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                },
                backgroundColor: Colors.transparent,
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
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                child: Container(
                  height: 160,
                  width: (MediaQuery.of(context).size.width) - 30,
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     image: AssetImage('assets/images/9038264.jpg'),
                    //     fit: BoxFit.cover),
                    gradient: LinearGradient(colors: [
                      Color(0xff83a4d4).withOpacity(0.4),
                      Color(0xffb6fbff).withOpacity(0.4)
                    ]),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isDarkMode
                          ? Colors.white
                          : Colors.black.withOpacity(0.7),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('HEIGHT',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isDarkMode
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.7),
                              ),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    final newValue = height - 1;
                                    height = newValue.clamp(0, 250);
                                  });
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.7),
                                )),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(height.round().toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isDarkMode
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.7),
                              ),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    final newValue = height + 1;
                                    height = newValue.clamp(0, 250);
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.7),
                                )),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          activeTrackColor: isDarkMode
                              ? Colors.white
                              : Colors.black.withOpacity(0.7),
                          inactiveTrackColor: isDarkMode
                              ? Colors.white.withOpacity(0.5)
                              : Colors.black.withOpacity(0.3),
                          trackShape: RoundedRectSliderTrackShape(),
                          trackHeight: 15.0,
                          thumbColor: Colors.blue,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 0),
                          overlayColor: Colors.blue.withAlpha(32),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 28.0),
                        ),
                        child: Slider(
                          value: height,
                          min: 0,
                          max: 250,
                          divisions: 100,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          },
                        ),
                      ),
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
                padding: const EdgeInsets.only(
                    left: 20, right: 10, top: 10, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                    child: Container(
                      height: 160,
                      width: (MediaQuery.of(context).size.width / 2) - 30,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xff83a4d4).withOpacity(0.4),
                          Color(0xffb6fbff).withOpacity(0.4)
                        ]),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isDarkMode
                              ? Colors.white
                              : Colors.black.withOpacity(0.7),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('WEIGHT',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 15,
                          ),
                          NumberPicker(
                            value: weight.toInt(),
                            minValue: 0,
                            axis: Axis.horizontal,
                            maxValue: 200,
                            itemWidth: 50,
                            itemHeight: 50,
                            selectedTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 25),
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            onChanged: (value) =>
                                setState(() => weight = value.toDouble()),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isDarkMode
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 20, top: 10, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                    child: Container(
                      height: 160,
                      width: (MediaQuery.of(context).size.width / 2) - 30,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xff83a4d4).withOpacity(0.4),
                          Color(0xffb6fbff).withOpacity(0.4)
                        ]),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isDarkMode
                              ? Colors.white
                              : Colors.black.withOpacity(0.7),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('AGE',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 15,
                          ),
                          NumberPicker(
                            value: age,
                            minValue: 0,
                            axis: Axis.horizontal,
                            maxValue: 150,
                            itemWidth: 50,
                            itemHeight: 50,
                            selectedTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 25),
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            onChanged: (value) => setState(() => age = value),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isDarkMode
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: BmiResult(
                          bmi: BmiModel(
                            age: age,
                            height: height,
                            weight: weight,
                            date: DateTime.now(),
                            bmiValue: bmiCalc(height, weight),
                            gender: _selectedSegment.name.toUpperCase(),
                            bodyNature: bodyNature[bodyType()],
                          ),
                        ),
                      ),
                    );
                    widget.onAddBmi(
                      BmiModel(
                        age: age,
                        height: height,
                        weight: weight,
                        date: DateTime.now(),
                        bmiValue: bmiCalc(height, weight),
                        gender: _selectedSegment.name.toUpperCase(),
                        bodyNature: bodyNature[bodyType()],
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: (MediaQuery.of(context).size.width) - 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xff83a4d4).withOpacity(0.4),
                        Color(0xffb6fbff).withOpacity(0.4)
                      ]),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isDarkMode
                            ? Colors.white
                            : Colors.black.withOpacity(0.7),
                      ),
                    ),
                    child: const Center(
                      child: Text('ENTER'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
