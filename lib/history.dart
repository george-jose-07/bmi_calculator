import 'package:bmi_calculator/bmi_model.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage(
      {super.key, required this.history, required this.onRemoveBmi});

  final List<BmiModel> history;
  final void Function(BmiModel bmi) onRemoveBmi;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(history[index]),
        onDismissed: (direction) {
          onRemoveBmi(history[index]);
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xff83a4d4), Color(0xffb6fbff)]),
              //color: Colors.blue.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'BMI : ',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      history[index].bmiValue.toStringAsFixed(2),
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'BODY TYPE : ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      history[index].bodyNature,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    const Text(
                      'HEIGHT : ',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      history[index].height.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 15),
                    ),
                    const Spacer(),
                    const Text(
                      'WEIGHT : ',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      history[index].weight.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    const Text(
                      'GENDER : ',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      history[index].gender,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const Spacer(),
                    const Text(
                      'AGE : ',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      history[index].age.toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.access_time_filled,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(history[index].date.day.toString()),
                    const Text('/'),
                    Text(history[index].date.month.toString()),
                    const Text('/'),
                    Text(history[index].date.year.toString()),
                    const SizedBox(
                      width: 40,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      itemCount: history.length,
    );
  }
}
