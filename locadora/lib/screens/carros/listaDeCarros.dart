import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:locadora/database/app_database.dart';
import '../../models/carros.dart';
import 'cadastroCarros.dart';

const _tituloAppBar = 'Carros Cadastrados';

class ListaCarros extends StatefulWidget {
  @override
  State<ListaCarros> createState() => _ListaCarrosState();
}

class _ListaCarrosState extends State<ListaCarros> {
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
              style: TextStyle(fontSize: 22.0),
            ),
            Icon(Icons.view_list_rounded, size: 36.0),
          ],
        ),
      ),
      body: FutureBuilder(
        initialData: [],
        future: findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Loading'),
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Carro> carros = snapshot.data as List<Carro>;
              return ListView.builder(
                itemBuilder: (context, indice) {
                  final Carro carro = carros[indice];

                  return _ItemCarro(carro);
                },
                itemCount: carros.length,
              );
          }
          return Text('Unkown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FormularioCarros(),
                ),
              )
              .then((value) => setState(() {}));
        },
        child: Icon(
          Icons.my_library_add_outlined,
          size: 30.0,
        ),
      ),
    );
  }
}

class _ItemCarro extends StatelessWidget {
  final Carro carro;

  _ItemCarro(this.carro);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(
          carro.marca,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          'Nome: ' +
              carro.name+
              '\n' +
              'Cor: ' +
              carro.cor +
              '\n' +
              'Cambio: ' +
              carro.cambio +
              '\n' +
              'Ano: ' +
              carro.ano.toString(),
              style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
