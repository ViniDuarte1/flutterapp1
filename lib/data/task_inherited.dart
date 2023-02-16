import 'package:flutter/material.dart';
import 'package:myfirstapp/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Tasks> taskList = [
    Tasks('Estudar Flutter','assets/images/slime.jpg',5,),
    Tasks('Andar de Bike','assets/images/slime.jpg',4,),
    Tasks('Ler','assets/images/slime.jpg',3,),
    Tasks('Meditar','assets/images/slime.jpg',2,),
    Tasks('Jogar','assets/images/slime.jpg',0,),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Tasks(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
