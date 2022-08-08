import 'package:flutter/material.dart';
import 'package:student_record/db/functions/Boxes.dart';
import 'package:student_record/db/functions/db_functions.dart';
import 'package:student_record/screens/edit_text_fields.dart';
import 'package:student_record/screens/screen_home.dart';
import 'package:student_record/screens/listsearch.dart';
import 'package:student_record/screens/search_list.dart';
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
  final _searchController = TextEditingController();

  List<String> name_list = [];

  @override
  // void dispose() {
  //   Hive.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    clearStdList();
    return Scaffold(
      backgroundColor: Color.fromARGB(84, 64, 195, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(115, 64, 195, 255),
        // title: SizedBox(
        //   height: 40,
        //   child: TextFormField(
        //     keyboardType: TextInputType.number,
        //     controller: _searchController,
        //     decoration: InputDecoration(
        //       prefixIcon: Icon(
        //         Icons.search,
        //         color: Color.fromARGB(121, 209, 209, 209),
        //       ),
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(100.0),
        //       ),
        //     ),
        //   ),
        // ),
        actions: [
          IconButton(
            onPressed: ({box}) {
              //printList();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchList()),
              );
              //NameSearch(context);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: ValueListenableBuilder<Box<StudentModel>>(
          valueListenable: Boxes.getRecord().listenable(),
          builder: (BuildContext ctx, box, _) {
            final student_data = box.values.toList().cast<StudentModel>();

            return ListView.separated(
              itemCount: student_data.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                final data = student_data[index];
                name_list.add(data.name);
                // print(data.name);
                addToList(data.name);

                return Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, left: 10, right: 10),
                  child: SizedBox(
                    height: 80,
                    child: Card(
                      color: Color.fromARGB(139, 64, 195, 255),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    StudentProfile(index: index)),
                          );
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data.name,
                              style: TextStyle(fontSize: 20),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (data.key != null) {
                                      // EditStudent(data.id!);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditTestFields(
                                                    nameholder: data.name,
                                                    heightholder: data.height,
                                                    ageholder: data.age,
                                                    weightholder: data.weight,
                                                    data_key: data.key,
                                                    index: index)),
                                      );
                                      print('deleted');
                                    } else {
                                      print('data.id is null ..ready akk');
                                    }
                                    print('index :$index,key :${data.key}');
                                    //deleteProfile(context);
                                  },
                                  icon: Icon(Icons.edit),
                                  color: Colors.white,
                                  iconSize: 30,
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (data.key != null) {
                                      // deleteStudent(data.id!);
                                      deleteStudent(data.key!);
                                      removeFromList(index);
                                      print('deleted');
                                    } else {
                                      print('data.id is null ..ready akk');
                                    }
                                    print('index :$index,key :${data.key}');
                                    //deleteProfile(context);
                                  },
                                  icon: Icon(Icons.delete),
                                  color: Colors.white,
                                  iconSize: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CircleAvatar(
                            radius: 37,
                            backgroundColor: Color.fromARGB(184, 37, 112, 95),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'lib/assets/images/profile/$index.jpg'),
                              radius: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}

//==================================================================
