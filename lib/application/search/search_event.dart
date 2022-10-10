part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchStudent extends SearchEvent {
  SearchStudent({required this.searchString});

  // TextEditingController? searchString;
  String searchString;
}
