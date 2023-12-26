import 'package:flutter/material.dart';

import '../absenceDataBase.dart';

class MyCheckBox extends StatefulWidget {
  Student student; var _class_name;

  MyCheckBox(this.student, this._class_name);

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState(student, this._class_name);
}

class _MyCheckBoxState extends State<MyCheckBox> {
  Student _student; var _class_name;
  _MyCheckBoxState(this._student, this._class_name);

  bool? isChecked = false;

  void updateDataBase(bool? value) async {
    int tmp_faltas=0;
    for (var studentClass in await studentClasses()) {
      if (studentClass.classId == _class_name && studentClass.studentId == this._student.id) tmp_faltas = studentClass.absenceNumber;
    }
    if (value == true) tmp_faltas+=1;
    else if (value == false) tmp_faltas-=1;
    // get class id
    var student_class = StudentClass(
      studentId: this._student.id,
      classId: this._class_name,
      absenceNumber: tmp_faltas,
    );
    await updateStudentClass(student_class);

    // print student updated
    for (var studentClass in await studentClasses()) {
      if (this._student.id == studentClass.studentId && this._class_name == studentClass.classId) {
        print("StudentClass{studentId: "+studentClass.studentId.toString()+", classId: "+studentClass.classId.toString()+", absenceNumber: "+studentClass.absenceNumber.toString()+"}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red.shade500;
      }
      return Colors.red.shade500;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          updateDataBase(value);
        });
      },
    );
  }
}
