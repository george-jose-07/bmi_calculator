import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

part 'bmi_model.g.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

@HiveType(typeId: 0)
class BmiModel extends HiveObject {
  @HiveField(0)
  int age;

  @HiveField(1)
  double height;

  @HiveField(2)
  String gender;

  @HiveField(3)
  double weight;

  @HiveField(4)
  DateTime date;

  @HiveField(5)
  String id;

  @HiveField(6)
  double bmiValue;

  @HiveField(7)
  String bodyNature;

  BmiModel({
    required this.age,
    required this.height,
    required this.weight,
    required this.date,
    required this.gender,
    required this.bmiValue,
    required this.bodyNature,
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}
