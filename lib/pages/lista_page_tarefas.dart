
import 'package:flutter/material.dart';

class ListaTarefaPage extends StatefulWidget{

  @override
  _ListaTarefaPageState createState() => _ListaTarefaPageState();
}

class _ListaTarefaPageState extends State<ListaTarefaPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: _criarAppBar(),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        tooltip: 'Nova Tarefa',
      ),
    );
  }

  AppBar _criarAppBar(){
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      title: Text('Tarefas'),
      centerTitle: false,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list),
        )
      ],
    );
  }
}