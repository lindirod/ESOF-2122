import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            child: Text(
              'Terminar',
              style: TextStyle(fontSize: 20.0),
            ),
            color: Colors.red.shade900,
            textColor: Colors.white,
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text that the user has entered by using the
                    // TextEditingController.
                    content: Text("Faltas Marcadas com Sucesso!"),
                  );
                },
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red.shade900)
            ),
          ),
        ],
      ),
      margin: const EdgeInsets.only(top: 5),
      alignment: Alignment.centerRight,
      width: 300,
      height: 70,
    );
  }
}
