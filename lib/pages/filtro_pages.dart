
import 'package:flutter/material.dart';
import 'package:gerenciador_tarefas/model/tarefa.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FiltroPage extends StatefulWidget{

  static const ROUTE_NAME = '/filtro';
  static const CHAVE_CAMPO_ORDERNACAO = 'campoOrdenacao';
  static const CHAVE_ORDERNAR_DECRESCENTE = 'usarOrdemDecrescente';
  static const CHAVE_FILTRO_DESCRICAO = 'filtroDescricao';

  @override
  _FiltroPageState createState() => _FiltroPageState();
}

class _FiltroPageState extends State<FiltroPage>{

  final camposParaOrdenacao = {
    Tarefa.campo_id: 'Codigo', Tarefa.campo_descricao: 'Descricao', Tarefa.campo_prazo: 'Prazo'
  };

  late final SharedPreferences prefs;
  final _descricaoController = TextEditingController();
  String _campoOrdenacao = Tarefa.campo_id;
  bool _usarOrdenacaoDecrescente = false;
  bool alterouValores = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: Text('Filtros e Ordenação'),
        ),
        body: _criarBody(),
      ),
      onWillPop: null,
    );
  }

  Widget _criarBody() {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Text('Campos para ordenação'),
        ),
        for (final campo in camposParaOrdenacao.keys)
          Row(
            children: [
              Radio(
                value: campo, 
                groupValue: _campoOrdenacao, 
                onChanged: _onCampoOrdenacaoChanged
              ),
              Text(camposParaOrdenacao[campo] ?? '')
            ],
          ),
        Divider(),
        Row(
          children:[
            Checkbox(
              value: _usarOrdenacaoDecrescente,
              onChanged: null,
            ),
            Text('Usar ordem decrescente')
          ]
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            decoration: InputDecoration(labelText: 'A descricao começa com:'),
          ),
        ),
        Divider()
      ],
    );
  }

  void _onCampoOrdenacaoChanged(String? valor) {
    prefs.setString(FiltroPage.CHAVE_CAMPO_ORDERNACAO, valor ?? '');

    alterouValores = true;

    setState(() {
      _campoOrdenacao = valor ?? '';
    });
  }

}