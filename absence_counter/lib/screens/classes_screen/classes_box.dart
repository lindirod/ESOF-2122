import 'package:flutter/material.dart';
import 'package:my_first_flutter/screens/classes_screen/classes_list.dart';

class ClassesBox extends StatelessWidget {
  var _scheadule;

  ClassesBox(this._scheadule);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClassesList(this._scheadule),
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 40),
      width: 350,
      height: 550,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white10,
          width: 1,
        ), //Border.all
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(
              5.0,
              5.0,
            ), //Offset
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ), //BoxDecoration
    );
  }
}
