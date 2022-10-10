import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:student_record/db/model/data_model.dart';
import 'package:student_record/infrastrecture/registerImpl.dart';
import 'package:student_record/screens/screen_add_student/widgets/add_image.dart';

part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc() : super(InitialState()) {
    on<EditEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CallStudentData>((event, emit) {
      final List<StudentModel> studentData = RegisterService.getStudentData();
      emit(EditState(student: studentData[event.index]));
      // TODO: implement event handler
    });
    on<SaveChanges>((event, emit) {
      RegisterService.editStudent(
          id: event.id,
          name: event.name,
          age: event.age,
          height: event.height,
          weight: event.weight,
          imagePath: event.imagePath);
    });
    on<EditImage>((event, emit) async {
      String? profilePic = await imagePath();
      state.student.imagePath = profilePic ?? state.student.imagePath;

      emit(state);
    });
  }
}
