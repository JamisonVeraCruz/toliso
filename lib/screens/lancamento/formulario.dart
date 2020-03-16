import 'package:flutter/material.dart';
import 'package:toliso/componentes/editor.dart';
import 'package:toliso/models/lancamento.dart';

class FormularioLancamento extends StatefulWidget {
  @override
  _FormularioLancamentoState createState() => _FormularioLancamentoState();
}

class _FormularioLancamentoState extends State<FormularioLancamento> {
  final TextEditingController _controladorCampoValor = TextEditingController();
  final TextEditingController _controladorCampoCategoria = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Lançamento"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controladorCampoValor,
            rotulo: 'Valor',
            dica: '0.00',
            icone: Icons.monetization_on,
            tipoTeclado: TextInputType.number,
          ),
          Editor(
            controlador: _controladorCampoCategoria,
            rotulo: 'Categoria',
            dica: 'Por exemplo: Transporte',
          ),
          RaisedButton(
            child: Text("Inserir"),
            onPressed: () {
              CriarLancamento(context);
            },
          )
        ],
      ),
    );
  }

  void CriarLancamento(BuildContext context) {
    final double valor = double.tryParse(_controladorCampoValor.text);
    final String categoria = _controladorCampoCategoria.text;
    final Lancamento lancamento = new Lancamento(valor, categoria);
    if (valor != null && categoria.isNotEmpty) {
      debugPrint('Lançamento Inserido!');
      debugPrint('$lancamento');
      Navigator.pop(context, lancamento);
    } else {
      debugPrint('Falta preencher um dos campos!');
    }
  }
}

