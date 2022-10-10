part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class CallStudentsData extends RegisterEvent {}

class RemoveStudent extends RegisterEvent {
  RemoveStudent({required this.id});
  final int id;
}
