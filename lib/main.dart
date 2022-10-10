import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_record/application/add_student/add_student_bloc.dart';
import 'package:student_record/application/edit/edit_bloc.dart';
import 'package:student_record/application/register/register_bloc.dart';
import 'package:student_record/application/search/search_bloc.dart';

import 'package:student_record/db/model/data_model.dart';
import 'package:student_record/screens/screen_home.dart';
import 'package:student_record/screens/screen_record.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => AddStudentBloc()),
        BlocProvider(create: (ctx) => RegisterBloc()),
        BlocProvider(create: (ctx) => EditBloc()),
        BlocProvider(create: (ctx) => SearchBloc()),
      ],
      child: (MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Student Record',
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          home: ScreenHome())),
    );
  }
}
