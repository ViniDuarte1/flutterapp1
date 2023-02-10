import 'package:flutter/material.dart';
import '../components/task.dart';

class InitalScreen extends StatefulWidget {
  const InitalScreen ({ Key? key }) : super(key: key);

  @override
  State<InitalScreen> createState() => _InitalScreenState();
}

class _InitalScreenState extends State<InitalScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text('Tarefas'),
            leading: Container(),
          ),
          body: AnimatedOpacity(
            opacity: opacity ? 1 : 0,
            duration: const Duration(seconds: 2),
            child: ListView(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Tasks(
                    'Estudar Flutter',
                    'assets/images/slime.jpg',
                    5,
                  ),
                ),
                Tasks(
                  'Andar de Bike',
                  'assets/images/slime.jpg',
                  4,
                ),
                Tasks(
                  'Ler',
                  'assets/images/slime.jpg',
                  3,
                ),
                Tasks(
                  'Meditar',
                  'assets/images/slime.jpg',
                  2,
                ),
                Tasks(
                  'Jogar',
                  'assets/images/slime.jpg',
                  0,
                ),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                opacity = !opacity;
              });
            },
            child: const Icon(Icons.remove_red_eye),
          ));
  }
}

