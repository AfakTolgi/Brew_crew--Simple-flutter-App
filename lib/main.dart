import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/Wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: authservices().user,
      child: MaterialApp(
        home: Wrapper(),
     
      ),
    );
  }
}
