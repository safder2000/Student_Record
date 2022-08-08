import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_record/db/functions/Boxes.dart';
import 'package:student_record/db/functions/db_functions.dart';
import 'package:student_record/db/model/data_model.dart';
import 'package:student_record/screens/edit_text_fields.dart';
import 'package:student_record/screens/listsearch.dart';
import 'package:student_record/screens/search_tile.dart';
import 'package:student_record/screens/student_profile.dart';

class SearchList extends StatefulWidget {
  SearchList({Key? key}) : super(key: key);

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(84, 64, 195, 255),
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          // decoration: InputDecoration(
          //     prefixIcon: Icon(
          //       Icons.badge,
          //       color: Colors.blue.shade400,
          //     ),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(100.0),
          //     ),
          //     hintText: 'Name'),
          decoration: InputDecoration(
              hintText: 'Enter a message',
              suffixIcon: IconButton(
                onPressed: searchController.clear,
                icon: Icon(Icons.clear),
              )),
        ),
        backgroundColor: Color.fromARGB(115, 64, 195, 255),
      ),
      body: ValueListenableBuilder(
          valueListenable: searchController,
          // valueListenable: _searchController.value,
          builder: (BuildContext ctx, index, Widget? child) {
            final box = Boxes.getRecord();

            final student_data = box.values.toList().cast<StudentModel>();
// changes
            List<StudentModel> filteredList = <StudentModel>[];
            //  for(int i=0; i<=student_data.length; i++){

            //  }
            for (StudentModel s in student_data) {
              if (s.name
                  .toUpperCase()
                  .contains(searchController.text.toUpperCase())) {
                filteredList.add(s);
              }
            }

            return Container(
                child: //student_data.contains(searchController.text)
                    filteredList.isNotEmpty
                        // ? printFound()
                        ? SearchTileBuilder(
                            student_data: filteredList,
                            index: index,
                          )
                        // : printNotFound(searchController.text)
                        : printNotFound());
          }),
    );
  }

  printFound() {
    print(
        '000000000000000000000==================search found====================00000000000000000');
  }

  printNotFound() {
    print(
        ' //////////////////////search Not found/////////////////////////////////');
  }
}
