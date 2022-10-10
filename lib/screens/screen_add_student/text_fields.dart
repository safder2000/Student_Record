import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_record/application/add_student/add_student_bloc.dart';

class TestFields extends StatelessWidget {
  TestFields({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  String imgTemp = '';
  // String? profilePic;
  @override
  Widget build(BuildContext context) {
    _nameController.clear();
    _ageController.clear();
    _heightController.clear();
    _weightController.clear();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          BlocBuilder<AddStudentBloc, AddStudentState>(
            builder: (context, state) {
              return CircleAvatar(
                  radius: 85,
                  backgroundColor: Color.fromARGB(213, 68, 137, 255),
                  child: GestureDetector(
                    onTap: () async {
                      // BlocProvider.of<AddStudentBloc>(context).add( AddStudentBloc.);
                      context.read<AddStudentBloc>().add(AddImage());
                    },
                    child: CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            state.imgPath != 'lib/assets/images/no_profile.jpg'
                                ? Image.file(File(state.imgPath)).image
                                : AssetImage(state.imgPath)
                        //  AssetImage('lib/assets/images/no_profile.jpg'),
                        // backgroundImage:
                        //    ,
                        ),
                  ));
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextFieldWidget(
            hint: 'Name',
            keybord: TextInputType.text,
            controller: _nameController,
            icon: Icon(
              Icons.badge,
              color: Colors.blue.shade400,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFieldWidget(
            hint: 'Age',
            controller: _ageController,
            icon: Icon(
              Icons.numbers,
              color: Color.fromARGB(255, 57, 192, 204),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextFieldWidget(
            hint: 'Height',
            controller: _heightController,
            icon: Icon(
              Icons.square_foot,
              color: Color.fromARGB(122, 80, 170, 15),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextFieldWidget(
            hint: 'Weight',
            controller: _weightController,
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
                child: BlocBuilder<AddStudentBloc, AddStudentState>(
                  builder: (context, state) {
                    return ElevatedButton.icon(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ))),
                      onPressed: () {
                        context.read<AddStudentBloc>().add(AddStudent(
                            name: _nameController.text,
                            age: _ageController.text,
                            height: _heightController.text,
                            weight: _weightController.text));
                        _nameController.clear();
                        _ageController.clear();
                        _heightController.clear();
                        _weightController.clear();
                        // state.imgPath = 'lib/assets/images/no_profile.jpg';
                      },
                      icon: const Icon(Icons.add),
                      label: const Text(
                        'Add  ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 230, 230, 230),
                            fontSize: 20),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextFormField TextFieldWidget({
    required String hint,
    required TextEditingController controller,
    required Icon icon,
    TextInputType keybord = TextInputType.number,
  }) {
    bool _validate = false;
    return TextFormField(
      keyboardType: keybord,
      controller: controller,
      validator: (value) {
        if (value == null || value.trim() == '') {
          _validate = true;
          return;
        }
      },
      decoration: InputDecoration(
          errorText: _validate ? 'Value Can\'t Be Empty' : null,
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          labelText: hint),
      textAlign: TextAlign.center,
    );
  }
}
