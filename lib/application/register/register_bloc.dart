import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:student_record/db/model/data_model.dart';
import 'package:student_record/infrastrecture/registerImpl.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(InitialState()) {
    on<RegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CallStudentsData>((event, emit) {
      final List<StudentModel> studentData = RegisterService.getStudentData();
      emit(RegisterState(studentsList: studentData));
      // TODO: implement event handler
    });
    on<RemoveStudent>((event, emit) {
      RegisterService.removeStudent(
        id: event.id,
      );
      emit(state);
      // TODO: implement event handler
    });
  }
}
