import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Meu Desespero",
            ),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.brown,
          ),
          body: ListaLancamentos(),
        ),
      ),
    );

class ListaLancamentos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ItemLancamentos(new Lancamentos(-120,"Restaurante")),
        ItemLancamentos(new Lancamentos(-150,"Motel")),
        ItemLancamentos(new Lancamentos(200, "Transferência")),
      ],
    );
  }
}

class ItemLancamentos extends StatelessWidget {

  final Lancamentos _lancamentos;

  ItemLancamentos(this._lancamentos);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: _lancamentos.valor < 0 ? Icon(Icons.money_off) : Icon(Icons.monetization_on),
        title: Text(
          _lancamentos.valor.toString(),
          style: _lancamentos.valor < 0 ? TextStyle(color: Colors.red): TextStyle(color: Colors.green),
        ),
        subtitle: Text(_lancamentos.cateogria),
      ),
    );
  }

}

class Lancamentos{
  final double valor;
  final String cateogria;

  Lancamentos(this.valor, this.cateogria);
}