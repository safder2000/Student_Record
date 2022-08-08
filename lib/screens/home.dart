import 'package:flutter/material.dart';
import 'package:student_record/db/functions/db_functions.dart';
import 'package:student_record/screens/navigation_screeen.dart';
import 'package:student_record/screens/record.dart';
import 'package:student_record/screens/text_fields.dart';

class home extends StatelessWidget {
  home({Key? key}) : super(key: key);
  var boxColor = Color.fromARGB(68, 105, 240, 175);
  var textColor = Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    getAllStudent();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(64, 105, 240, 175),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecordList()),
                );
              },
              child: Container(
                height: 200,
                width: size.width,
                decoration: BoxDecoration(
                    color: Color.fromARGB(108, 208, 240, 105),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Record',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: textColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavigationSceen()),
                );
              },
              child: Container(
                height: 200,
                width: size.width,
                decoration: BoxDecoration(
                    color: Color.fromARGB(111, 105, 240, 175),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: textColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestFields()),
                );
              },
              child: Container(
                height: 200,
                width: size.width,
                decoration: BoxDecoration(
                    color: Color.fromARGB(110, 105, 224, 240),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add Student',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: textColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
