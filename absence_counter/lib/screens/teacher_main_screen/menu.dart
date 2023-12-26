import 'package:flutter/material.dart';
import 'package:my_first_flutter/screens/login.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            children: [
              const ListTile(
                  title: Text(' ')
              ),
              ListTile(
                title: Text('Área Pessoal',
                    style: TextStyle(
                        color: Colors.red.withRed(140),
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans")),
                onTap: () => print('Area Pessoal'),
              ),
              ListTile(
                title: Text('Horário',
                    style: TextStyle(
                        color: Colors.red.withRed(140),
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans")),
                onTap: () => print('Horario'),
              ),
              ListTile(
                title: Text('Marcar Faltas',
                    style: TextStyle(
                        color: Colors.red.withRed(140),
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans")),
                onTap: () => selectedItem(context, 3),
              ),
              ListTile(
                title: Text('Sobre',
                    style: TextStyle(
                        color: Colors.red.withRed(140),
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans")),
                onTap: () => print('Sobre'),
              ),
              ListTile(
                title: Text('Bugs e Sugestões',
                    style: TextStyle(
                        color: Colors.red.withRed(140),
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans")),
                onTap: () => print('Bugs'),
              ),
              ListTile(
                title: Text('Logout',
                    style: TextStyle(
                        color: Colors.red.withRed(140),
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans")),
                onTap: () => selectedItem(context, 6),
              ),
            ]
        )
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 3:
      //Navigator.of(context).push(
      //    MaterialPageRoute(builder: (context) => ClassesScreen()));
        break;
      case 6:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => LoginForm()));
        break;
    }
  }
}