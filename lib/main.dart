import 'package:bytebank2/database/app_database.dart';
import 'package:flutter/material.dart';

// import 'screens/contact_form.dart';
// import 'screens/contacts_list.dart';
import 'models/contact.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(MyApp());
  //save(ClasseContact(0, 'Livia', 1900));
  findAll().then((contacts) => debugPrint(contacts.toString()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
