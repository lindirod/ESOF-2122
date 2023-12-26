import 'package:flutter/material.dart';
import 'students_list.dart';

class Box extends StatelessWidget {
  var _students_list; var _class_name;

  Box(this._students_list, this._class_name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Students_List(this._students_list, this._class_name),
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(top: 20),
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
