import 'package:student_record/db/functions/Boxes.dart';
import 'package:student_record/db/model/data_model.dart';

class RegisterService {
  static addStudent({required StudentModel value}) {
    final box = Boxes.getRecord();
    box.add(value);
  }

  static onAddStudentButtonClicked({
    required String name,
    required String age,
    required String height,
    required String weight,
    required String imagePath,
  }) {
    // final _name = _nameController.text.trim();
    // final _age = _ageController.text.trim();
    // final _height = _heightController.text.trim();
    // final _weight = _weightController.text.trim();
    if (name == null ||
        name.trim() == '' ||
        age == null ||
        age.trim() == '' ||
        height == null ||
        height.trim() == '' ||
        weight == null ||
        weight.trim() == '') {
      return null;
    } else {
      final student = StudentModel(
        name: name,
        age: age,
        height: height,
        weight: weight,
        imagePath: imagePath,
      );
      // addStudent(_student);
      return student;
    }
  }

  static searchStudent({required String searchString}) {
    final box = Boxes.getRecord();
    final student_data = box.values.toList();
    List<StudentModel> filteredList = [];
    for (StudentModel temp in student_data) {
      if (temp.name.toUpperCase().contains(searchString.toUpperCase())) {
        filteredList.add(temp);
      }
    }
    return filteredList;
  }

  static getStudentData() {
    final allData = Boxes.getRecord();
    final student_data = allData.values.toList().cast<StudentModel>();
    return student_data;
  }

  static removeStudent({required int id}) async {
    final box = Boxes.getRecord();
    await box.delete(id);
  }

  static editStudent({
    // required StudentModel studentModel,
    required int id,
    required String name,
    required String age,
    required String height,
    required String weight,
    required String imagePath,
    // required StudentModel studentModel,
  }) {
    final student = StudentModel(
      name: name,
      age: age,
      height: height,
      weight: weight,
      imagePath: imagePath,
    );

    final box = Boxes.getRecord();
    box.put(id, student);
  }
  // Future<void> onEditStudentButtonClicked(
  //     int editKey, BuildContext context) async {
  //   var _name = _nameController.text.trim();
  //   var _age = _ageController.text.trim();
  //   var _height = _heightController.text.trim();
  //   var _weight = _weightController.text.trim();

  //   if (_name.isEmpty) {
  //     _name = nameholder;
  //   }
  //   if (_age.isEmpty) {
  //     _age = ageholder;
  //   }
  //   if (_height.isEmpty) {
  //     _height = heightholder;
  //   }
  //   if (_weight.isEmpty) {
  //     _weight = weightholder;
  //   }
  //   // (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
  //   //   (BuildContext context, int index) {
  //   //     final data = studentList[index];

  //   //     data.name = _name;
  //   //     data.age = _age;
  //   //     data.height = _height;
  //   //     data.weight = _weight;

  //   //     data.save();
  //   //   };
  //   // };

  //   final _student = StudentModel(
  //     name: _name,
  //     age: _age,
  //     height: _height,
  //     weight: _weight,
  //   );
  //   // UpdateStudent(_student);
  //   final box = Boxes.getRecord();
  //   box.put(editKey, _student);
  //   print('saved data');
  //   Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (ctx) => NavigationSceen()),
  //       (route) => false);
  // }
}
