import 'package:bytebank2/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bytebank2/database/app_database.dart';

import '../app_database.dart';

class ContactDao {

  Future<int> save(Contact contact) {
    return createDatabase().then((db) {
      final Map<String, dynamic> contactMap = Map();
      // contactMap['id'] = contact.id;
      contactMap['name'] = contact.name;
      contactMap['account_Number'] = contact.accountNumber;
      return db.insert('contacts', contactMap);
    });
  }

  Future<List<Contact>> findAll() async{
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query('contacts');
    final List<Contact> contacts = List();
    for (Map<String, dynamic> row in result) {
      final Contact contact =
      Contact(row['id'], row['name'], row['account_Number']);
      contacts.add(contact);
    }
    return contacts;


    // return createDatabase().then((db) {
    //   return db.query('contacts').then((maps) {
    //     final List<Contact> contacts = List();
    //     for (Map<String, dynamic> map in maps) {
    //       final Contact contact =
    //           Contact(map['id'], map['name'], map['account_Number']);
    //       contacts.add(contact);
    //     }
    //     return contacts;
    //   });
    // });
  }

}