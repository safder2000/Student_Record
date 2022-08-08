import 'package:flutter/material.dart';
import 'package:student_record/db/functions/db_functions.dart';
import 'package:student_record/screens/edit_text_fields.dart';
import 'package:student_record/screens/listsearch.dart';
import 'package:student_record/screens/student_profile.dart';

class SearchTileBuilder extends StatelessWidget {
  const SearchTileBuilder({Key? key, this.index, this.student_data})
      : super(key: key);

  final index;
  final student_data;
  @override
  Widget build(BuildContext context) {
    
    return ListView.separated(
      itemCount: student_data.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        final data = student_data[index];
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
                        builder: (context) => StudentProfile(index: index)),
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
                      backgroundImage:
                          AssetImage('lib/assets/images/profile/$index.jpg'),
                      radius: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        // print(data.name);
      },
    );
  }
}
