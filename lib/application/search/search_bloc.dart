import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:student_record/db/model/data_model.dart';
import 'package:student_record/infrastrecture/registerImpl.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialState()) {
    on<SearchEvent>((event, emit) {});
    on<SearchStudent>((event, emit) {
      log(event.searchString.toString());
      // final List<StudentModel> studentData = RegisterService.getStudentData();
      List<StudentModel> studentData =
          RegisterService.searchStudent(searchString: event.searchString);
      emit(SearchState(studentsList: studentData));
    });
  }
}
