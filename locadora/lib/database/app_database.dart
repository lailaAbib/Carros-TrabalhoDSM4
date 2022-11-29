import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/carros.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then(
    (dbPath) {
      final String path = join(dbPath, 'bancoCarros.db');
      return openDatabase(
        path,
        onCreate: (db, version) {
          db.execute(
            'CREATE TABLE carros( '
            'id INTEGER PRIMARY KEY, '
            'marca TEXT, '
            'name TEXT, '
            'cor TEXT, '
            'cambio TEXT, '
            'ano INTEGER)',
          );
        },
        version: 1,
      );
    },
  );
}

Future<int> save(Carro carro) {
  return createDatabase().then(
    (db) {
      final Map<String, dynamic> carroMap = Map();
      // calcadoMap['id'] = calcado.id;
      carroMap['marca'] = carro.marca;
      carroMap['name'] = carro.name;
      carroMap['cor'] = carro.cor;
      carroMap['cambio'] = carro.cambio;
      carroMap['ano'] = carro.ano;
      return db.insert('carros', carroMap);
    },
  );
}

Future<List<Carro>> findAll() {
  return createDatabase().then(
    (db) {
      return db.query('carros').then(
        (maps) {
          final List<Carro> carros = [];
          for (Map<String, dynamic> map in maps) {
            final Carro carro = Carro(
              map['id'],
              map['marca'],
              map['name'],
              map['cor'],
              map['cambio'],
              map['ano'],
            );
            carros.add(carro);
          }
          return carros;
        },
      );
    },
  );
}
