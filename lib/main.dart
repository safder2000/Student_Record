import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_record/db/model/data_model.dart';
import 'package:student_record/screens/screen_home.dart';
import 'package:student_record/screens/record.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  await Hive.openBox<StudentModel>('student_db');
  runApp(const StudentRecord());
}

class StudentRecord extends StatelessWidget {
  const StudentRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return (MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Record',
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        home: ScreenHome()));
  }
}
