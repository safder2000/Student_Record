part of 'add_student_bloc.dart';

@immutable
abstract class AddStudentEvent {}

class AddImage extends AddStudentEvent {
  // AddImage({required this.imageWidget});
  //   ImageProvider<Object>? imageWidget;
}

class AddStudent extends AddStudentEvent {
  AddStudent({
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
  });
  String name;
  String age;
  String weight;
  String height;
}
