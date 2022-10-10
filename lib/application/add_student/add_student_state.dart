part of 'add_student_bloc.dart';

@immutable
class AddStudentState {
  String imgPath;
  AddStudentState({required this.imgPath});
}

class InitialState extends AddStudentState {
  InitialState() : super(imgPath: 'lib/assets/images/no_profile.jpg');
}
