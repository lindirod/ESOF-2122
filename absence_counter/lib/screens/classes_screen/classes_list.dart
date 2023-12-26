import 'package:flutter/material.dart';
import 'package:my_first_flutter/screens/classes_screen/classes_item.dart';
import '../absenceDataBase.dart';

class ClassesList extends StatelessWidget {
  var _schedule;

  ClassesList(this._schedule);

  void addToDataBase(int id, String name) async {
    // adicionar UC à base de dados
    var uc = Class(
      id: id,
      name: name,
    );
    await insertClass(uc);
    await insertStudents(id);
    print(await classes());
  }

  List<Widget> data() {
    List<Widget> list = [];
    print(this._schedule['horario']);

    for (var aula in this._schedule['horario']) {
      // se a cadeira for teorica não conta porque não há faltas
      if (aula['tipo'] != 'T') {
        list.add(ClassesItem(
            aula['ucurr_sigla'], "(" + aula['tipo'] + ")", aula['sala_sigla'], aula['ocorrencia_id']));

        addToDataBase(aula['ocorrencia_id'], aula['ucurr_sigla']);
      }
    }
    return list; // all widget added now return the list here
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: data()),
    );
  }
}
