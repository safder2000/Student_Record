import 'package:flutter/material.dart';
import 'package:student_record/db/functions/db_functions.dart';
import 'package:student_record/screens/navigation_screeen.dart';
import 'package:student_record/screens/record.dart';
import 'package:student_record/screens/text_fields.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudent();
    return Scaffold(
      body: SafeArea(child: NavigationSceen()),
    );
  }
}
