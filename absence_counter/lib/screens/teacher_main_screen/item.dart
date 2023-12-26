import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/screens/absenceDataBase.dart';
import 'package:my_first_flutter/screens/teacher_main_screen/checkbox.dart';

class Item extends StatelessWidget {
  Student _student; var _class_name;

  Item(this._student, this._class_name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.account_box_rounded, size: 50),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(this._student.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans")),
                Text(this._student.id.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans")),
              ],
            ),
          ),
          MyCheckBox(this._student, this._class_name),
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
  }
}
