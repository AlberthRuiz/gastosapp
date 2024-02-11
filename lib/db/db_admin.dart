import 'dart:io';

import 'package:gastosapp/models/gasto_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DBAdmin {
  Database? myDatabase;

  static final DBAdmin pepe = DBAdmin.mandarina();

  DBAdmin.mandarina();

  factory DBAdmin() {
    return pepe;
  }

  Future<Database?> checkDatabase() async {
    myDatabase ??= await initDatabase();
    return myDatabase;
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    String pathDatabase = join(directory.path, "GastosDB.db");
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    return await openDatabase(
      pathDatabase,
      version: 1,
      onCreate: (Database db, int version) {
        db.execute("""CREATE TABLE GASTOS (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              title TEXT, 
              price REAL, 
              datetime TEXT, 
              type TEXT
              )""");
      },
    );
  }

  Future<List<GastoModel>> obtenerGastos() async {
    Database? db = await checkDatabase();
    List<Map<String, dynamic>> data = await db!.query("GASTOS");
    print(data);
    List<GastoModel> gastoLista =
        data.map((e) => GastoModel.convertirDeMapaAModelo(e)).toList();
    return gastoLista;
  }

  Future<int> insertarGastos(GastoModel gastoModel) async {
    Database? db = await checkDatabase();
    int resp = await db!.insert("GASTOS", gastoModel.convertirAMapa());
    return resp;
  }
}
