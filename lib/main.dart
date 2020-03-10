import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(toliso());

class toliso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: ListaLancamentos());
  }
}

class ListaLancamentos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meu Desespero",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ItemLancamentos(new Lancamentos(-120, "Restaurante")),
          ItemLancamentos(new Lancamentos(-150, "Motel")),
          ItemLancamentos(new Lancamentos(200, "Transferência")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddLancamentos()),
          );
        },
      ),
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
        leading: _lancamentos.valor < 0
            ? Icon(Icons.money_off)
            : Icon(Icons.monetization_on),
        title: Text(
          _lancamentos.valor.toString(),
          style: _lancamentos.valor < 0
              ? TextStyle(color: Colors.red)
              : TextStyle(color: Colors.green),
        ),
        subtitle: Text(_lancamentos.cateogria),
      ),
    );
  }
}

class Lancamentos {
  final double valor;
  final String cateogria;

  Lancamentos(this.valor, this.cateogria);
}

class AddLancamentos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Lançamentos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.00),
        child: Column(
          children: <Widget>[
            TextField(
              style: TextStyle(fontSize: 24.0),
              decoration: const InputDecoration(
                labelText: "Lançamento",
                hintText: 'Digite o lançamento',
              ),
            ),
            TextField(
              style: TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                labelText: "Valor",
                hintText: 'Somente valor numérico (R\$ 0.00)',
              ),
            ),
            Center(
              child: RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ItemLancamentos(new Lancamentos(-150, "Outra coisa")),
                    ),
                  );
                },
                child: Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
