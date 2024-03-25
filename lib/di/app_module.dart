import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@module
abstract class AppModule {
  @preResolve
  Future<Database> get db => openDatabase(
        'notes_db',
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)',
          );
        },
      );
}
