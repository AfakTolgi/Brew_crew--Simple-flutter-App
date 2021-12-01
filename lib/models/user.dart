import 'package:brew_crew/authenticate/register.dart';

class User{

  final String uid;

  User({required this.uid});
}

class Userdata{

  final String uid;
  final String name;
  final String sugar;
  final int strength;
  Userdata({required this.uid,required this.name,required this.sugar,required this.strength});


}