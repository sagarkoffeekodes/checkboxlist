import 'package:checkboxlist/MyHomePage.dart';
import 'package:checkboxlist/googlesheet.dart';
import 'package:flutter/material.dart';

import 'callApi/usersheet_api.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkbox List',
      theme: ThemeData(

      ),
      home: GoogleSheet_file(),
    );
  }
}
