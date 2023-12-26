import 'package:flutter/material.dart';
import '../absenceDataBase.dart';
import 'item.dart';

class MyList extends StatelessWidget {
  var _schedule; var user_id;

  MyList(this._schedule, this.user_id);

  void addToDataBase(int id, String name) async {
    // adicionar UC à base de dados
    List<Class> l = await classes();
    if (l.length == 0) return;
    var uc = Class(
      id: id,
      name: name,
    );
    await insertClass(uc);
    await insertStudents(id);
  }

  List<Widget> data() {
    List<Widget> list = [];
    print(this._schedule['horario']);

    for (var aula in this._schedule['horario']) {
      // se a cadeira for teorica não conta porque não há faltas
      if (aula['tipo'] != 'T') {
        list.add(Item(aula['ucurr_sigla'], aula['ocorrencia_id'], aula['doc_sigla'],
            aula['sala_sigla'], "(" + aula['tipo'] + ")", user_id));
        addToDataBase(aula['ocorrencia_id'], aula['ucurr_sigla']);
      }
    }
    return list; // all widget added now retrun the list here
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: data()),
    );
  }
}
