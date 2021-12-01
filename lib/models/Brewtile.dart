import 'package:brew_crew/home/brew_list.dart';
import 'package:brew_crew/models/brews.dart';
import 'package:flutter/material.dart';

class brewtile extends StatelessWidget {
  final brew brews;
  brewtile({required this.brews});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/coffee_icon.png'),
            radius: 25.0,
            backgroundColor: Colors.brown[brews.strenght]),
          title: Text(brews.name),
          subtitle: Text('this person takes ${brews.sugar} sugars'),
        ),
      ),
    );
  }
}