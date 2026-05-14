import 'package:att7/database.dart';
import 'package:att7/model/filme_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  final List<Filme> filmes = Database.getFilmes();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Imkge',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          foregroundColor: const Color.fromARGB(255, 71, 71, 64),
          backgroundColor: const Color.fromARGB(255, 233, 217, 73),
        ),
        body: ListView.builder(
          itemCount: filmes.length,
          itemBuilder: (context, index) {
            final filme = filmes[index];
            return Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 82, 80, 80)

              ),
              child: ListTile(
              leading: Icon(
                Icons.movie,
                color: const Color.fromARGB(255, 247, 230, 77),
              ),
              title: Text(filme.titulo),
              textColor: const Color.fromARGB(255, 255, 254, 254),
              subtitle: Text('Ano: ${filme.anoLancamento}'),
              trailing: Row(
                mainAxisSize:
                  MainAxisSize.min,
                children: [
                  Icon(Icons.bolt, color: Colors.amber, size:18),
                  Text(filme.imdb.toString()),
                ],

              ),
              onTap: (){
                print('Clicou em: ${filme.titulo}');
              }
              )
            );
          }
        )
      ),
    );
  }
}
