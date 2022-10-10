import 'package:flutter/material.dart';

import 'package:student_record/screens/navigation_screeen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // getAllStudent();
    return Scaffold(
      body: SafeArea(child: NavigationSceen()),
    );
  }
}
