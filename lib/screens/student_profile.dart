import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_record/db/functions/Boxes.dart';

import 'package:student_record/db/model/data_model.dart';
import 'package:student_record/screens/navigation_screeen.dart';

class StudentProfile extends StatelessWidget {
  int index;
  StudentProfile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Boxes.getRecord();
    final student_data = box.values.toList().cast<StudentModel>();
    final data = student_data[index];
    return Scaffold(
        backgroundColor: Color.fromARGB(28, 255, 82, 82),
        appBar: AppBar(),
        body: ListView(
          children: [
            SizedBox(height: 10),
            CircleAvatar(
              backgroundColor: Colors.red[400],
              radius: 88,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 198, 54, 43),
                radius: 85,
                child: CircleAvatar(
                  backgroundImage:
                      data.imagePath != 'lib/assets/images/no_profile.jpg'
                          ? Image.file(File(data.imagePath)).image
                          : AssetImage(data.imagePath),
                  radius: 80,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              data.name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(129, 244, 67, 54),
                    borderRadius: BorderRadius.circular(20)),
                height: 350,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Age    : ${data.age}',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        'Height : ${data.height}',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        'Weight : ${data.weight}',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(height: 10),
                    ]),
              ),
            )
          ],
        )
        // }),
        );
  }

  Future<void> deleteProfile(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (ctx) => NavigationSceen()),
          (route) => false);
    });
  }
}
