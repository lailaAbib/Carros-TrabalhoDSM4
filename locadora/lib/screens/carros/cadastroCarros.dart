import 'package:flutter/material.dart';

import '../../database/app_database.dart';
import '../../models/carros.dart';

const _tituloAppBar = 'Novo Carro';

class FormularioCarros extends StatefulWidget {
  @override
  State<FormularioCarros> createState() => _FormularioCarrosState();
}

class _FormularioCarrosState extends State<FormularioCarros> {
  final TextEditingController _marcaController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _corController = TextEditingController();

  final TextEditingController _cambioController = TextEditingController();

  final TextEditingController _anoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _tituloAppBar,
              style: TextStyle(fontSize: 26.0),
            ),
            Icon(Icons.style, size: 36.0),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _marcaController,
              decoration: InputDecoration(
                labelText: 'Marca',
                hintText: 'Honda',
              ),
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Cruze',
              ),
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _corController,
              decoration: InputDecoration(
                labelText: 'Cor',
                hintText: 'Chumbo',
              ),
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _cambioController,
              decoration: InputDecoration(
                labelText: 'Câmbio',
                hintText: 'Manual ou Automático',
              ),
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _anoController,
              decoration: InputDecoration(
                labelText: 'Ano',
                hintText: '2022',
              ),
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.maxFinite,
              height: 36,
              child: ElevatedButton(
                child: Text(
                  'Adicionar',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  final String marca = _marcaController.text;
                  final String name = _nameController.text;
                  final String cor = _corController.text;
                  final String cambio = _cambioController.text;
                  final int? ano =
                          int.tryParse(_anoController.text);
                  final Carro newCarro = Carro(0, marca, name, cor,
                      cambio, ano!);
                  save(newCarro).then((id) => Navigator.pop(context));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
