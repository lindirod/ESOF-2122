import 'package:flutter/material.dart';
import 'package:my_first_flutter/screens/classes_screen/classes_box.dart';
import '../teacher_main_screen/menu.dart';
import '../profile.dart';

class ClassesScreen extends StatelessWidget {
  var _scheadule;

  ClassesScreen(this._scheadule);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text(
            "Uni",
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          actions: [Profile()],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 30, left: 50),
                alignment: Alignment.bottomLeft,
                child: Text("Unidades Curriculares",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 30.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans"))),
            ClassesBox(this._scheadule),
          ],
        ));
  }
}