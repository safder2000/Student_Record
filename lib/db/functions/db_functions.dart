import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_record/db/functions/Boxes.dart';
import 'package:student_record/db/model/data_model.dart';
import 'package:student_record/screens/search_list.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
ValueNotifier<List<SearchList>> searchChanged = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  //calling database(opening database)
  // final _id = await studentDB.add(value);
  // value.id = _id;

  final box = Boxes.getRecord();
  box.add(value);
  //  box.put(value.name,value);

  // studentListNotifier.value.add(value);
  // studentListNotifier.notifyListeners();
}

Future<void> UpdateStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');

  // studentDB.put(value.id, value);
  // studentListNotifier.notifyListeners();
}

Future<void> getAllStudent() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(var id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.delete(id);
  await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> searchStudent(List<String> student_listr) async {
  final studentBB = await Hive.openBox<StudentModel>('student_db');
  final std_record = Boxes.getRecord();
  List a = std_record.values.toList();
  print(studentBB.name);

  // final student = std_record.get(searchValue);
  // print(student);
  ValueListenableBuilder<Box<StudentModel>>(
    valueListenable: Boxes.getRecord().listenable(),
    builder: (BuildContext ctx, box, _) {
      final student_data = box.values.toList().cast<StudentModel>();
      //List <String>stdList;

      // for (int i = 0; i < student_data.length; i++) {
      //   var dataFromList = student_data[i];
      //   String nameData = dataFromList.name;

      // }

      return ListView();

    },
  );
}


