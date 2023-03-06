import 'package:myfirstapp/components/task.dart';
import 'package:myfirstapp/data/db.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_dificulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _dificulty = 'dificulty';
  static const String _image = 'image';

  save(Tasks tarefa) async {
    final Database dbapp = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      return await dbapp.insert(
        _tablename,
        taskMap,
      );
    } else {
      return await dbapp.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Future<List<Tasks>> findAll() async {
    final Database dbapp = await getDatabase();
    final List<Map<String, dynamic>> result = await dbapp.query(
      _tablename,
    );
    return toList(result);
  }

  Future<List<Tasks>> find(String nomedatarefa) async {
    final Database dbapp = await getDatabase();
    final List<Map<String, dynamic>> result = await dbapp.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomedatarefa],
    );
    return toList(result);
  }

  delete(String nomedatarefa) async {
    final Database dbapp = await getDatabase();
    return await dbapp.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomedatarefa],
    );
  }

  //metodos to list e to map
  List<Tasks> toList(List<Map<String, dynamic>> taskList) {
    final List<Tasks> tarefas = [];
    for (Map<String, dynamic> row in taskList) {
      final Tasks tarefa = Tasks(
        row[_name],
        row[_image],
        row[_dificulty],
      );
      tarefas.add(tarefa);
    }
    return tarefas;
  }

  Map<String, dynamic> toMap(Tasks tarefa) {
    final Map<String, dynamic> values = Map();
    values[_name] = tarefa.nome;
    values[_dificulty] = tarefa.dificuldade;
    values[_image] = tarefa.foto;
    return values;
  }
}
