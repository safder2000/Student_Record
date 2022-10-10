part of 'edit_bloc.dart';

@immutable
class EditState {
  final StudentModel student;
  EditState({required this.student});
}

class InitialState extends EditState {
  InitialState() : super(student: temp);
}

final temp = StudentModel(
  name: "name",
  age: "age",
  height: "height",
  weight: "weight",
  imagePath: 'lib/assets/images/no_profile.jpg',
);
