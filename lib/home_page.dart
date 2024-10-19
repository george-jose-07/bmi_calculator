import 'package:bmi_calculator/add_bmi.dart';
import 'package:bmi_calculator/bmi_model.dart';
import 'package:bmi_calculator/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<BmiModel> _bmiHistory = [];

  getBmi() async {
    var box = await Hive.openBox<BmiModel>('hive_box');
    setState(() {
      _bmiHistory = box.values.toList();
    });
  }

  @override
  void initState() {
    getBmi();
    super.initState();
  }

  void _addBmi(BmiModel history) async {
    var box = await Hive.openBox<BmiModel>('hive_box');
    setState(() {
      _bmiHistory.add(history);
      box.add(history);
    });
  }

  void _removeExpense(BmiModel history) async {
    final expenseIndex = _bmiHistory.indexOf(history);
    var box = await Hive.openBox<BmiModel>('hive_box');
    setState(() {
      _bmiHistory.remove(history);
      box.deleteAt(expenseIndex);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("expense deleted"),
        action: SnackBarAction(
          label: "undo",
          onPressed: () async {
            var box = await Hive.openBox<BmiModel>('hive_box');
            setState(
              () {
                _bmiHistory.insert(expenseIndex, history);
                box.put(expenseIndex, history);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    Widget mainContent = _bmiHistory.isEmpty
        ? const Center(
            child: Text(
            'History is empty',
            style: TextStyle(color: Colors.white),
          ))
        : HistoryPage(history: _bmiHistory, onRemoveBmi: _removeExpense);

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/dark.jpg'),
              fit: BoxFit.cover,
              invertColors: isDarkMode ? false : true,
              opacity: 1),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: const Text(
                "BMI CALCULATOR",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 2,
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .shimmer(
                    duration: 3000.ms,
                    delay: 1000.ms,
                    color: Color(0xffb6fbff),
                  ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: _selectedIndex == 0
              ? AddBmi(
                  onAddBmi: _addBmi,
                )
              : mainContent,
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home_outlined),
                  label: 'HOME',
                  backgroundColor: Colors.blue.withOpacity(0.5)),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.history),
                  label: 'HISTORY',
                  backgroundColor: Colors.blue.withOpacity(0.5))
            ],
            currentIndex: _selectedIndex,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            elevation: 80,
          ),
        ));
  }
}
