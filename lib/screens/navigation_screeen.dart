import 'package:flutter/material.dart';
import 'package:student_record/screens/home.dart';
import 'package:student_record/screens/screen_record.dart';
import 'package:student_record/screens/screen_add_student/text_fields.dart';

class NavigationSceen extends StatefulWidget {
  NavigationSceen({Key? key, this.page}) : super(key: key);
  int? page;
  @override
  State<NavigationSceen> createState() => _NavigationSceenState();
}

class _NavigationSceenState extends State<NavigationSceen> {
  int currentIndex = 1;
  final screens = [home(), ScreenRecordList(), TestFields()];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black87,
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
                backgroundColor: Color.fromARGB(111, 105, 240, 175)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.book,
                ),
                label: 'Record',
                backgroundColor: Color.fromARGB(141, 64, 195, 255)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                label: 'user',
                backgroundColor: Color.fromARGB(121, 224, 100, 116)),
          ],
        ));
  }
}
