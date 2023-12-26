import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../profile.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Uni",
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          actions: [Profile()],
        ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "Erro",
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red.shade900,
                        fontWeight: FontWeight.w400,
                        fontSize: 50.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans")),
                Text(
                    "Neste momento, a turma escolhida não tem uma aula a decorrer. Por favor tente novamente mais tarde.",
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red.shade900,
                        fontWeight: FontWeight.w400,
                        fontSize: 30.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans")),
              ],
            ),
          ),
        ],
      )
    );
  }
}
