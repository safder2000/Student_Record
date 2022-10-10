import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_record/application/register/register_bloc.dart';

import 'package:student_record/screens/edit_text_fields.dart';

import 'package:student_record/screens/listsearch.dart';
import 'package:student_record/screens/search_list.dart';
import 'package:student_record/screens/student_profile.dart';

class ScreenRecordList extends StatelessWidget {
  ScreenRecordList({Key? key}) : super(key: key);
  final _searchController = TextEditingController();

  List<String> name_list = [];

  @override
  // void dispose() {
  //   Hive.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(84, 64, 195, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(115, 64, 195, 255),
        actions: [
          IconButton(
            onPressed: ({box}) {
              //printList();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchList()),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body:
          // ValueListenableBuilder<Box<StudentModel>>(
          //     valueListenable: Boxes.getRecord().listenable(),
          //     builder: (BuildContext ctx, box, _) {
          //       final student_data = box.values.toList().cast<StudentModel>();

          //       return
          BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          context.read<RegisterBloc>().add(CallStudentsData());
          return ListView.separated(
            itemCount: state.studentsList.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final data = state.studentsList[index];
              name_list.add(data.name);
              // print(data.name);
              // addToList(data.name);

              return Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
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
                                          builder: (context) => EditTestFields(
                                                index: index,
                                                editKey: data.key,
                                              )),
                                    );
                                  } else {
                                    log("data.id can't be  null ..ready akk oole");
                                  }
                                  log('index :$index,key :${data.key}');
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
                                    // deleteStudent(data.key!);
                                    context
                                        .read<RegisterBloc>()
                                        .add(RemoveStudent(id: data.key));
                                    // removeFromList(index);
                                    // print('deleted');
                                  } else {
                                    // print('data.id is null ..ready akk');
                                  }
                                  // print('index :,key :${data.key}');
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
                            backgroundImage: data.imagePath !=
                                    'lib/assets/images/no_profile.jpg'
                                ? Image.file(File(data.imagePath)).image
                                : AssetImage(
                                    'lib/assets/images/no_profile.jpg'),
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
        },
      ),
    );
  }
}


//==================================================================
