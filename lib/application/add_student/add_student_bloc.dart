import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:student_record/db/model/data_model.dart';
import 'package:student_record/infrastrecture/registerImpl.dart';
import 'package:student_record/screens/screen_add_student/widgets/add_image.dart';

part 'add_student_event.dart';
part 'add_student_state.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  AddStudentBloc() : super(InitialState()) {
    on<AddImage>((event, emit) async {
      String? profilePic = await imagePath();

      return emit(AddStudentState(
          imgPath: profilePic ?? 'lib/assets/images/no_profile.jpg'));
    });
    on<AddStudent>((event, emit) async {
      final student = RegisterService.onAddStudentButtonClicked(
          age: event.age,
          height: event.height,
          name: event.name,
          weight: event.weight,
          imagePath: state.imgPath);
      if (student == null) {
        return;
      } else {
        RegisterService.addStudent(value: student);
        state.imgPath = 'lib/assets/images/no_profile.jpg';
      }
    });
  }
}
