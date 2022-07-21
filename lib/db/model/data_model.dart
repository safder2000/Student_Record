import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
   String name;
  @HiveField(2)
   String age;
  @HiveField(3)
   String height;
  @HiveField(4)
   String weight;

  StudentModel(
      {required this.name,
      required this.age,
      required this.height,
      required this.weight,
      this.id});
      
}
