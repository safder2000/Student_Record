import 'package:flutter/material.dart';
import 'package:student_record/db/functions/db_functions.dart';
import 'package:student_record/db/model/data_model.dart';
import 'package:student_record/screens/record.dart';

class StudentProfile extends StatelessWidget {
  int index;
  StudentProfile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(28, 255, 82, 82),
        appBar: AppBar(),
        body: ValueListenableBuilder(
            valueListenable: studentListNotifier,
            builder: (BuildContext ctx, List<StudentModel> studentList,
                Widget? child) {
              final data = studentList[index];
              return ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 18.0, top: 18),
                      //   child: IconButton(
                      //     onPressed: () {
                      //       if (data.key != null) {
                      //         deleteStudent(data.key!);
                      //         print('deleted');
                      //       } else {
                      //         print('data.id is null ..ready akk');
                      //       }
                      //       //deleteProfile(context);
                      //     },
                      //     icon: Icon(Icons.delete),
                      //     color: Colors.white,
                      //     iconSize: 30,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 10),
                  CircleAvatar(
                    backgroundColor: Colors.red[400],
                    radius: 88,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 198, 54, 43),
                      radius: 85,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          'lib/assets/images/no_profile.jpg',
                        ),
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
              );
            }));
  }

  Future<void> deleteProfile(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (ctx) => RecordList()), (route) => false);
    });
  }
}
