import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tarefas'),
          leading: Container(),
        ),
        body: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Tasks(
                'Estudar Flutter', 'http://cbissn.ibict.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png',
              ),
            ),
            Tasks(
              'Andar de Bike', 'https://www.bikemagazine.com.br/wp-content/uploads/2012/02/primeira-bike1.jpg',
            ),
            Tasks(
              'Ler', 'https://editorialpaco.com.br/wp-content/uploads/2019/07/c8c74d9bca132ddb5e608bb5b212b386.jpg',
            ),
            Tasks(
              'Meditar', 'https://img.freepik.com/vetores-gratis/mulher-relaxada-meditando_23-2148525630.jpg?w=826&t=st=1674743507~exp=1674744107~hmac=8caa127ed4bb91596e9ec74383bc85c9b8104eb981455217affb706e768f5d46',
            ),
            Tasks(
              'Jogar', 'https://i0.wp.com/jornal.usp.br/wp-content/uploads/2022/06/202205601_jogos_streaming.jpg?w=1200&ssl=1',
            )
          ],
        ),
        /*       floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ), */
      ),
    );
  }
}

class Tasks extends StatefulWidget {
  final String nome;
  final String foto;
  const Tasks(this.nome, this.foto, {Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  int nivel = 0;
  String teste = 'UP';
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
              height: 140,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 72,
                        height: 100,
                        color: Colors.black26,
                        child: Image.network(
                            widget.foto,
                            fit: BoxFit.cover),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          widget.nome,
                          style: const TextStyle(
                              fontSize: 24, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 52,
                          width: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              if (nivel < 10) {
                                setState(() {
                                  nivel++;
                                });
                              }
                              if (nivel == 10) {
                                setState(() {
                                  teste = 'MAX';
                                });
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  '$teste',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: nivel / 10,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Nivel: $nivel',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
