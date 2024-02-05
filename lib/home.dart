import 'package:bmi_calculator/Bmi_ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  Gender _selectedSegment = Gender.male;
  int _selectedIndex = 0;
  void BackgroundIndex() {
    setState(() {
      if (_selectedIndex == 0)
        _selectedIndex = 1;
      else
        _selectedIndex = 0;
    });
  }

  TextEditingController HeightTextController = TextEditingController();
  TextEditingController WeightTextController = TextEditingController();
  TextEditingController AgeTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _selectedIndex == 0 ? Color.fromRGBO(50, 50, 50, 80) : Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  BackgroundIndex();
                },
                icon: Icon(
                  _selectedIndex == 0 ? Icons.dark_mode : Icons.light_mode,
                  color: _selectedIndex == 0 ? Colors.white54 : Colors.black,
                )),
          )
        ],
        backgroundColor:
            _selectedIndex == 0 ? Color.fromRGBO(50, 50, 50, 80) : Colors.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
                child: Text("BMI CALCULATOR",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        color: _selectedIndex == 0
                            ? Colors.white54
                            : Colors.black),
                    textScaleFactor: 2),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoSlidingSegmentedControl(
                    children: <Gender, Widget>{
                      Gender.male: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 35),
                        child: Column(
                          children: [
                            Text(
                              'MALE',
                              style: TextStyle(
                                  color: _selectedIndex == 0
                                      ? Colors.white54
                                      : Colors.black),
                              textScaleFactor: 1.5,
                            ),
                            Icon(
                              Icons.male,
                              color: _selectedIndex == 0
                                  ? Colors.white54
                                  : Colors.black,
                              size: 35,
                            )
                          ],
                        ),
                      ),
                      Gender.female: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 35),
                        child: Column(
                          children: [
                            Text('FEMALE',
                                style: TextStyle(
                                    color: _selectedIndex == 0
                                        ? Colors.white54
                                        : Colors.black),
                                textScaleFactor: 1.5),
                            Icon(
                              Icons.female,
                              color: _selectedIndex == 0
                                  ? Colors.white54
                                  : Colors.black,
                              size: 35,
                            )
                          ],
                        ),
                      ),
                    },
                    backgroundColor: Colors.transparent,
                    thumbColor: _selectedIndex == 0 ? Colors.red : Colors.blue,
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
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  style: TextStyle(
                      color:
                          _selectedIndex == 0 ? Colors.white54 : Colors.black),
                  textAlign: TextAlign.center,
                  controller: HeightTextController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.5),
                    ),
                    labelText: "Enter Your Height in centimeter",
                    labelStyle: TextStyle(
                        color: _selectedIndex == 0
                            ? Colors.white54
                            : Colors.black),
                    fillColor: _selectedIndex == 0
                        ? Color.fromRGBO(50, 50, 50, 80)
                        : Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(110, 110, 110, 100)),
                        borderRadius: BorderRadius.circular(16.5)),
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
                  style: TextStyle(
                      color:
                          _selectedIndex == 0 ? Colors.white54 : Colors.black),
                  textAlign: TextAlign.center,
                  controller: WeightTextController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.5),
                    ),
                    labelText: "Enter Your Weigth in kilogram",
                    labelStyle: TextStyle(
                        color: _selectedIndex == 0
                            ? Colors.white54
                            : Colors.black),
                    fillColor: _selectedIndex == 0
                        ? Color.fromRGBO(50, 50, 50, 80)
                        : Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(110, 110, 110, 100)),
                        borderRadius: BorderRadius.circular(16.5)),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'please enter weigth';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  style: TextStyle(
                      color:
                          _selectedIndex == 0 ? Colors.white54 : Colors.black),
                  textAlign: TextAlign.center,
                  controller: AgeTextController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.5),
                    ),
                    labelText: "Enter Your Age",
                    labelStyle: TextStyle(

                        color: _selectedIndex == 0
                            ? Colors.white54
                            : Colors.black),
                    fillColor: _selectedIndex == 0
                        ? Color.fromRGBO(50, 50, 50, 80)
                        : Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(110, 110, 110, 100)),
                        borderRadius: BorderRadius.circular(16.5)),
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
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Bmi_Result(
                              height: HeightTextController.text,
                              weight: WeightTextController.text,
                              age: AgeTextController.text,
                              gender: _selectedSegment.name,
                              clr: _selectedIndex.toString()),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 65,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 0 ? Colors.red : Colors.blue,
                      borderRadius: BorderRadius.circular(16.5),
                    ),
                    child: Center(
                      child: Text(
                        "ENTER",
                        style: TextStyle(
                            color: _selectedIndex == 0
                                ? Colors.white54
                                : Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
