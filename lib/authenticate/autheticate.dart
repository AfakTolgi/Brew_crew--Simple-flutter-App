import 'package:brew_crew/authenticate/register.dart';
import 'package:brew_crew/authenticate/signin.dart';
import 'package:flutter/material.dart';

class autheticate extends StatefulWidget {
  const autheticate({ Key? key }) : super(key: key);

  @override
  _autheticateState createState() => _autheticateState();
}

class _autheticateState extends State<autheticate> {
  bool isSIgnin = true;
  void toggleview(){
    setState(() => isSIgnin = !isSIgnin);
  }
  @override
  Widget build(BuildContext context) {
    if (isSIgnin){
      return signin(toggleview: toggleview,);
    }else{
      return register(toggleview: toggleview,);
    }
  }
}