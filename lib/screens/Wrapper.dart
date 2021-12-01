import 'package:brew_crew/authenticate/autheticate.dart';
import 'package:brew_crew/home/home.dart';
import 'package:brew_crew/models/user.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null){
      return autheticate();
    }else{
      return home();
    }
  }
}