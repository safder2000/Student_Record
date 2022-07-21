import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_record/db/functions/Boxes.dart';
import 'package:student_record/db/functions/db_functions.dart';
import 'package:student_record/db/model/data_model.dart';
import 'package:student_record/screens/record.dart';

class EditTestFields extends StatelessWidget {
  EditTestFields({
    Key? key,
    required this.nameholder,
    required this.ageholder,
    required this.heightholder,
    required this.weightholder,
    this.data_key,
  }) : super(key: key);

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  var nameholder;
  var ageholder;
  var heightholder;
  var weightholder;
  var data_key;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
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
                helperText: 'Name',
                hintText: nameholder,
              ),
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
                hintText: ageholder,
                helperText: 'Age',
              ),
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
                hintText: heightholder,
                helperText: 'Height',
              ),
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
                hintText: weightholder,
                helperText: 'Weight',
              ),
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RecordList()),
                      );
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ))),
                    onPressed: () {
                      onEditStudentButtonClicked(data_key, context);
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
        ),
      ),
    );
  }

  Future<void> onEditStudentButtonClicked(
      int editKey, BuildContext context) async {
    var _name = _nameController.text.trim();
    var _age = _ageController.text.trim();
    var _height = _heightController.text.trim();
    var _weight = _weightController.text.trim();

    if (_name.isEmpty) {
      _name = nameholder;
    }
    if (_age.isEmpty) {
      _age = ageholder;
    }
    if (_height.isEmpty) {
      _height = heightholder;
    }
    if (_weight.isEmpty) {
      _weight = weightholder;
    }
    // (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
    //   (BuildContext context, int index) {
    //     final data = studentList[index];

    //     data.name = _name;
    //     data.age = _age;
    //     data.height = _height;
    //     data.weight = _weight;

    //     data.save();
    //   };
    // };

    final _student =
        StudentModel(name: _name, age: _age, height: _height, weight: _weight);
    // UpdateStudent(_student);
    final box = Boxes.getRecord();
    box.put(editKey, _student);
    print('saved data');
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (ctx) => RecordList()), (route) => false);
  }
}
