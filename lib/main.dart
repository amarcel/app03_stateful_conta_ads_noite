import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: TelaConta(),
  ));
}

class TelaConta extends StatefulWidget {
  const TelaConta({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CalcContaEstado();
  }
}

class _CalcContaEstado extends State<TelaConta> {
  final _formCalc = GlobalKey<FormState>();
  double _valor = 0.0;
  var _valorTotal;

  void _calcTotal() {
    setState(() {
      _valorTotal = _valor * 110 / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conta'),
      ),
      body: Form(
          key: _formCalc,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: 'Valor da conta'),
                validator: (value) {
                  // função anônima!
                  // corpo da função anônima:
                  if (value!.isEmpty) {
                    return 'Informe um valor.';
                  } else {
                    _valor = double.parse(value);
                    if (_valor < 0) {
                      return 'O valor deve ser maior que zero.';
                    }
                  }
                  return null;
                }, // fim da função anônima
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formCalc.currentState!.validate()) {
                      _calcTotal();
                    }
                  },
                  child: const Text('Calcular com 10%')),
              Text(
                'Valor total R\$ $_valorTotal',
                style: const TextStyle(fontSize: 20),
              )
            ],
          )),
    );
  }
} // fim _CalcContaEstado
