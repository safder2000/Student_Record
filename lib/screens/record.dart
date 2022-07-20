import 'package:flutter/material.dart';
import 'package:student_record/db/functions/db_functions.dart';
import 'package:student_record/screens/screen_home.dart';
import 'package:student_record/screens/student_profile.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../db/model/data_model.dart';

class RecordList extends StatefulWidget {
  RecordList({Key? key}) : super(key: key);

  @override
  State<RecordList> createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

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
                      Row(
                        children: [
                          Icon(
                            Icons.monitor_weight,
                            size: 20,
                          ),
                          Text(
                            'A : ${data.age}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (data.key != null) {
                            // deleteStudent(data.id!);
                            deleteStudent(data.key!);
                            print('deleted');
                          } else {
                            print('data.id is null ..ready akk');
                          }
                          print('index :$index,key :${data.key}');
                          //deleteProfile(context);
                        },
                        icon: Icon(Icons.delete),
                        color: Colors.white,
                        iconSize: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          if (data.key != null) {
                            // deleteStudent(data.id!);
                            deleteStudent(data.key!);
                            print('deleted');
                          } else {
                            print('data.id is null ..ready akk');
                          }
                          print('index :$index,key :${data.key}');
                          //deleteProfile(context);
                        },
                        icon: Icon(Icons.delete),
                        color: Colors.white,
                        iconSize: 20,
                      ),
                    ],
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
