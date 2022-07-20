import 'package:flutter/material.dart';
import 'package:student_record/db/functions/db_functions.dart';
import 'package:student_record/screens/screen_home.dart';
import 'package:student_record/screens/student_profile.dart';

import '../db/model/data_model.dart';

class RecordList extends StatefulWidget {
  RecordList({Key? key}) : super(key: key);

  @override
  State<RecordList> createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
          valueListenable: studentListNotifier,
          builder: (BuildContext ctx, List<StudentModel> studentList,
              Widget? child) {
            return ListView.separated(
              itemCount: studentList.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                final data = studentList[index];

                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentProfile(index: index)),
                    );
                  },
                  title: Text(
                    data.name,
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.square_foot,
                            size: 20,
                          ),
                          Text(
                            'H : ${data.height}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.monitor_weight,
                            size: 20,
                          ),
                          Text(
                            'W : ${data.weight}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Text(
                    'Age : ${data.age}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('lib/assets/images/no_profile.jpg'),
                    radius: 30,
                  ),
                );
              },
            );
          }),
    );
  }
}
