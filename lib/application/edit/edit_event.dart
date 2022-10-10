part of 'edit_bloc.dart';

@immutable
abstract class EditEvent {}

class CallStudentData extends EditEvent {
  int index;
  CallStudentData({required this.index});
}

class EditImage extends EditEvent {
  // EditImage({required this.newImgPath});
  // String newImgPath;
}

class SaveChanges extends EditEvent {
  SaveChanges({
    // required studentModel, required id
    required this.id,
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    required this.imagePath,
  });
  // late int id;
  int id;
  String name;
  String age;
  String weight;
  String height;
  String imagePath;
}
