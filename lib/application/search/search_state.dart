part of 'search_bloc.dart';

@immutable
class SearchState {
  final List<StudentModel> studentsList;
  SearchState({required this.studentsList});
}

class InitialState extends SearchState {
  InitialState() : super(studentsList: []);
}
