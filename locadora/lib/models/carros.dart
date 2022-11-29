import 'package:locadora/main.dart';

class Carro {
  final int id;
  final String marca;
   final String name;
  final String cor;
  final String cambio;
  final int ano;
 

  Carro(
    this.id,
    this.marca,
    this.name,
    this.cor,
    this.cambio,
    this.ano,
  );

  @override
  String toString() {
    return 'Carro {id: $id, marca: $marca, name: $name, cor: $cor, cambio: $cambio, ano: $ano}';
  }
}
