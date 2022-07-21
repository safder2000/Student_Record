import 'package:flutter/material.dart';
import 'package:student_record/db/functions/db_functions.dart';
import 'package:student_record/db/model/data_model.dart';

class TestFields extends StatelessWidget {
  TestFields({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.blueGrey,
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
             keyboardType: TextInputType.text,
            controller: _nameController,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.badge,
                  color: Colors.blue.shade400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                hintText: 'Name'),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
             keyboardType: TextInputType.number,
            controller: _ageController,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.numbers,
                  color: Color.fromARGB(255, 57, 192, 204),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                hintText: 'Age'),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
             keyboardType: TextInputType.number,
            controller: _heightController,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.square_foot,
                  color: Color.fromARGB(122, 80, 170, 15),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                hintText: 'Height'),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
             keyboardType: TextInputType.number,
            controller: _weightController,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.monitor_weight,
                  color: Color.fromARGB(122, 81, 15, 139),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                hintText: 'Weight'),
            textAlign: TextAlign.center,
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ))),
                  onPressed: () {
                    onAddStudentButtonClicked();
                  },
                  icon: const Icon(Icons.add),
                  label: const Text(
                    'Add  ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 230, 230, 230),
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _height = _heightController.text.trim();
    final _weight = _weightController.text.trim();
    if (_name.isEmpty || _age.isEmpty || _height.isEmpty || _weight.isEmpty) {
      return;
    }

    final _student =
        StudentModel(name: _name, age: _age, height: _height, weight: _weight);
    addStudent(_student);
  }
}
