import 'package:flutter/material.dart';
import 'box.dart';
import '../profile.dart';
import 'menu.dart';

class StudentScreen extends StatelessWidget {
  var _schedule; var _user_id;

  StudentScreen(this._schedule, this._user_id);

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
                margin: const EdgeInsets.only(top: 20, left: 50),
                alignment: Alignment.bottomLeft,
                child: Text("Faltas",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 30.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans"))),
            Box(this._schedule, this._user_id),
          ],
        ));
  }
}
