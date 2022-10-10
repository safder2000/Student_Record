part of 'register_bloc.dart';

@immutable
class RegisterState {
  final List<StudentModel> studentsList;
  RegisterState({required this.studentsList});
}

class InitialState extends RegisterState {
  InitialState() : super(studentsList: []);
}
