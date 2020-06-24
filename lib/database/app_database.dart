import 'package:bytebank2/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then(
    (dbPath) {
      final String path = join(dbPath, 'bytebank.db');
      return openDatabase(
        path,
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE contacts (id INTEGER PRIMARY KEY, name TEXT, account_number INT)',
          );
        },
        version: 1,
      );
    },
  );
}

Future<int> save(ClasseContact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    //contactMap['id'] = contact.id; o Sqlite é responsável por fazer o incremento
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap);
  });
}

Future<List<ClasseContact>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<ClasseContact> contacts = List();
      for (Map<String, dynamic> map in maps) {
        final ClasseContact contact = ClasseContact(
          map['id'],
          map['name'],
          map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}
