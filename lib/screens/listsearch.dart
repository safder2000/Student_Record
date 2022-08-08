import 'package:flutter/material.dart';

List<String> std_list = [];

Future<void> addToList(String student_listr) async {
  std_list.add(student_listr);
  print(std_list);
}

void printList() {
  print(std_list);
}

void removeFromList(int index) {
  std_list.removeAt(index);
}

void clearStdList() {
  std_list.clear();
}

NameSearch(context) {
  showSearch(
      context: context,
      // delegate to customize the search bar
      delegate: ListSearch(std_list));
}

class ListSearch extends SearchDelegate {
  ListSearch(var stored_list) {
    final student_data = stored_list.values.toList();
    print(student_data);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    var suggestions = std_list.where((element) {
      return std_list.contains(query.toLowerCase());
    });
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return ListTile(
          title: Text(
        suggestions.elementAt(index),
      ));
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestions = std_list.where((element) {
      return std_list.contains(query.toLowerCase());
    });
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return ListTile(
          title: Text(
        suggestions.elementAt(index),
      ));
    });
  }
}
