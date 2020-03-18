import 'package:flutter/material.dart';
import 'package:toliso/componentes/editor.dart';
import 'package:toliso/componentes/seletor.dart';
import 'package:toliso/models/lancamento.dart';
import 'package:toliso/screens/lancamento/validacoes.dart';

const _tituloAppBar = 'Novo Lançamento';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoCategoria = 'Categoria';
const _dicaCampoCategoria = 'Exemplo: Transporte';

const List<String> _listaCategorias = ['Aluguel', 'Alimentação', 'Transporte'];

const _rotuloBotaoSalvar = 'Salvar';

class FormularioLancamento extends StatefulWidget {

  @override
  _FormularioLancamentoState createState() => _FormularioLancamentoState();
}

class _FormularioLancamentoState extends State<FormularioLancamento> {
  final TextEditingController _controladorCampoValor = TextEditingController();
  //final TextEditingController _controladorCampoCategoria = TextEditingController();
  String _controladorListaCategoria =  _listaCategorias[0];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        autovalidate: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.00),
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on,
                tipoTeclado: TextInputType.number,
                validador: ValidaLancamento.valor,
              ),
              //Editor(
                //controlador: _controladorCampoCategoria,
                //rotulo: _rotuloCampoCategoria,
                //dica: _dicaCampoCategoria,
                //validador: ValidaLancamento.categoria,
              //),
              Seletor(
                controlador: _controladorListaCategoria,
                lista: _listaCategorias,
                dica: _dicaCampoCategoria,
                rotulo: _rotuloCampoCategoria,
                validador: ValidaLancamento.categoria,
              ),
              RaisedButton(
                child: Text(_rotuloBotaoSalvar),
                onPressed: () {
                  if (_formKey.currentState.validate()){
                    _criarLancamento(context);
                  }
                },
              )
            ],
          ),
        ),
      )
    );
  }

  void _criarLancamento(BuildContext context) {
    final double valor = double.tryParse(_controladorCampoValor.text);
    //final String categoria = _controladorCampoCategoria.text;
    final String categoria = _controladorListaCategoria;
    final Lancamento lancamento = new Lancamento(valor, categoria);
    if (valor != null && categoria.isNotEmpty) {
      Navigator.pop(context, lancamento);
    } else {
      debugPrint('Falta preencher um dos campos!');
    }
  }
}

