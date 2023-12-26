import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../absenceDataBase.dart';

class Item extends StatelessWidget {
  String _class_name, _teacher_name, _class_room, _class_type;
  int _class_id; var user_id;

  Item(this._class_name, this._class_id, this._teacher_name,
      this._class_room, this._class_type, this.user_id);

  Future<int> getAbsenceNumber() async {
    // get student absence number
    int number_of_absences = 0;
    for (var studentClass in await studentClasses()) {
      if (studentClass.studentId == int.parse(this.user_id.substring(2)) && studentClass.classId == _class_id) {
        number_of_absences = studentClass.absenceNumber;
        print("StudentClass{studentId: "+studentClass.studentId.toString()+", classId: "+studentClass.classId.toString()+", absenceNumber: "+studentClass.absenceNumber.toString()+"}");
      }
    }
    return number_of_absences;
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: getAbsenceNumber(),
        builder: (BuildContext context, AsyncSnapshot<int> text) {
      return new Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(_class_room,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 15.0,
                    fontStyle: FontStyle.normal,
                    fontFamily: "OpenSans")),
            Text(_class_name,
                style: TextStyle(
                    color: Colors.red.shade900,
                    fontWeight: FontWeight.w300,
                    fontSize: 30.0,
                    fontStyle: FontStyle.normal,
                    fontFamily: "OpenSans")),
            Text(_class_type + "\n" + _teacher_name,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 15.0,
                    fontStyle: FontStyle.normal,
                    fontFamily: "OpenSans")),
            Text(text.data.toString() + "/3",
                style: TextStyle(
                    color: Colors.red.shade900,
                    fontWeight: FontWeight.w300,
                    fontSize: 25.0,
                    fontStyle: FontStyle.normal,
                    fontFamily: "OpenSans"))
          ],
        ),
        margin: const EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        width: 300,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 1,
          ), //Border.all
          borderRadius: BorderRadius.circular(5),
        ),
      );
    });
  }
}
