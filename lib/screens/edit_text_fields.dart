import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_record/application/edit/edit_bloc.dart';

import 'package:student_record/screens/navigation_screeen.dart';

class EditTestFields extends StatelessWidget {
  EditTestFields({
    Key? key,
    required this.index,
    this.editKey,
  }) : super(key: key);

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  int index;
  int? editKey;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<EditBloc, EditState>(
          builder: (context, state) {
            context.read<EditBloc>().add(CallStudentData(index: index));
            // _nameController.text = state.student.name;
            // _ageController.text = state.student.age;
            // _heightController.text = state.student.height;
            // _weightController.text = state.student.weight;
            return ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<EditBloc>().add(EditImage());
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.red[400],
                    radius: 88,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 198, 54, 43),
                      radius: 85,
                      child: CircleAvatar(
                        backgroundImage: state.student.imagePath !=
                                'lib/assets/images/no_profile.jpg'
                            ? Image.file(File(state.student.imagePath)).image
                            : AssetImage(state.student.imagePath),
                        radius: 80,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextEditWidget(
                  controller: _nameController,
                  keybord: TextInputType.text,
                  helperText: 'Name',
                  icon: Icon(
                    Icons.badge,
                    color: Colors.blue.shade400,
                  ),
                  initialValue: state.student.name,
                ),
                SizedBox(
                  height: 30,
                ),
                TextEditWidget(
                  controller: _ageController,
                  initialValue: state.student.age,
                  helperText: 'Age',
                  icon: Icon(
                    Icons.numbers,
                    color: Color.fromARGB(255, 57, 192, 204),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextEditWidget(
                  controller: _heightController,
                  initialValue: state.student.height,
                  helperText: 'Height',
                  icon: Icon(
                    Icons.square_foot,
                    color: Color.fromARGB(122, 80, 170, 15),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextEditWidget(
                  controller: _weightController,
                  initialValue: state.student.weight,
                  helperText: 'Weight',
                  icon: Icon(
                    Icons.monitor_weight,
                    color: Color.fromARGB(122, 81, 15, 139),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ))),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => NavigationSceen()),
                              (route) => false);
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 40,
                        ),
                        label: const Text(
                          '',
                          style: TextStyle(
                              color: Color.fromARGB(255, 230, 230, 230),
                              fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ))),
                        onPressed: () {
                          if (_nameController.text == '') {
                            _nameController.text = state.student.name;
                          } else {
                            state.student.name = _nameController.text;
                          }

                          if (_ageController.text == '') {
                            _ageController.text = state.student.age;
                          } else {
                            state.student.age = _ageController.text;
                          }

                          if (_heightController.text == '') {
                            _heightController.text = state.student.height;
                          } else {
                            state.student.height = _heightController.text;
                          }
                          if (_weightController.text == '') {
                            _weightController.text = state.student.weight;
                          } else {
                            state.student.weight = _weightController.text;
                          }
                          // context.read<EditBloc>().add(SaveChanges(
                          //     studentModel: state.student,
                          //     id: state.student.key));
                          BlocProvider.of<EditBloc>(context).add(SaveChanges(
                              id: state.student.key,
                              name: state.student.name,
                              age: state.student.age,
                              height: state.student.height,
                              weight: state.student.weight,
                              imagePath: state.student.imagePath));
                          Navigator.pop(context);

                          // onEditStudentButtonClicked(data_key, context);
                        },
                        icon: const Icon(Icons.save),
                        label: const Text(
                          'Save  ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 230, 230, 230),
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  TextEditWidget({
    required controller,
    required String helperText,
    required initialValue,
    required icon,
    keybord = TextInputType.number,
  }) {
    return TextFormField(
      keyboardType: keybord,
      // controller: controller,
      initialValue: initialValue,
      onChanged: ((value) {
        controller.text = value;
      }),
      decoration: InputDecoration(
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        helperText: helperText,
      ),
      textAlign: TextAlign.center,
    );
  }
}
