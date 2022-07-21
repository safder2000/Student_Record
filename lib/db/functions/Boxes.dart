import 'package:student_record/db/model/data_model.dart';

import 'package:hive/hive.dart';

class Boxes {
  static Box<StudentModel> getRecord() => Hive.box<StudentModel>('student_db');
}
