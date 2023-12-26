import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/screens/classes_screen/classes_screen.dart';
import 'package:my_first_flutter/screens/session.dart';
import 'package:my_first_flutter/screens/students_main_screen/students_screen.dart';

import 'absenceDataBase.dart';

const loginUrl =
'https://sigarra.up.pt/feup/pt/mob_val_geral.autentica';

// Performs login and retrieves the user code if succeeded.
Future<User?> login(Session session, String username, String password) async {
  var data = await session.post(loginUrl,
      {'pv_login': username, 'pv_password': password});
  if (data["authenticated"]) {
    return User.fromJson(data);
  } else {
    return null;
  }
}

const studentScheduleUrl =
    'https://sigarra.up.pt/feup/pt/mob_hor_geral.estudante';
const teacherScheduleUrl =
    'https://sigarra.up.pt/feup/pt/mob_hor_geral.docente';

Future<dynamic> getUserSchedule(Session session, User user,
    String dataIni, String dataFim) async {
  var url = (user.type == "F"? teacherScheduleUrl : studentScheduleUrl)
      + "?pv_codigo=${user.code}&pv_semana_ini=$dataIni&pv_semana_fim=$dataFim";
  return await session.get(url);
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool ishiddenPassword = true;

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'UNI',
            style: Theme.of(context).textTheme.headline3,
          ),

          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: username,
            decoration: InputDecoration(
                hintText: 'Username',
                contentPadding:
                EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0))),
          ),
          TextField(
            obscureText: ishiddenPassword,
            controller: password,
            decoration: InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
              hintText: 'Password',
              suffixIcon: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                  Icons.visibility,
                ),
              ),
            ),
          ),
          FlatButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              'Entrar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(color: Colors.red.shade900)),
            onPressed: () async {
              if (username.text != null &&  password.text != null) {
                Session s = new Session();
                User? user = await login(s, username.text, password.text);
                initialize();
                if (user != null) {
                  var schedule = await getUserSchedule(s, user, "20220515", "20220521");
                  if (user.type == "F") {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ClassesScreen(schedule)));
                  }
                  else {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => StudentScreen(schedule, username.text)));
                  }
                }
                else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text that the user has entered by using the
                        // TextEditingController.
                        content: Text("Password ou Username Incorretos!"),
                      );
                    },
                  );
                }
              }
            },

          ),
          FlatButton(
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              onPressed: null)
        ],
      ),
    );
  }

  void _togglePasswordView() {
    if (ishiddenPassword == true) {
      ishiddenPassword = false;
    } else {
      ishiddenPassword = true;
    }
  }
}