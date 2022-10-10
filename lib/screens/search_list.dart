import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:student_record/application/search/search_bloc.dart';

import 'package:student_record/screens/search_tile.dart';

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
          onChanged: (value) {
            context.read<SearchBloc>().add(SearchStudent(searchString: value));
            log(value);
          },
          controller: searchController,
          decoration: InputDecoration(
              hintText: 'Enter a message',
              suffixIcon: IconButton(
                onPressed: searchController.clear,
                icon: Icon(Icons.clear),
              )),
        ),
        backgroundColor: Color.fromARGB(115, 64, 195, 255),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return Container(
              child: state.studentsList.isNotEmpty
                  ? SearchTileBuilder(
                      student_data: state.studentsList,
                    )
                  : const Center(child: Text('Search Not Found')));
        },
      ),
      // }),
    );
  }
}
