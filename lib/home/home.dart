import 'package:brew_crew/home/brew_list.dart';
import 'package:brew_crew/home/settingsdropdown.dart';
import 'package:brew_crew/models/brews.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final authservices _auth = authservices();
  @override
  Widget build(BuildContext context) {
    void _settingbottomsheets(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: settingsdropdown(),);
      });
    }
    return StreamProvider<List<brew>>.value(
      value: database().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text('Brew_crew'),
          actions: [
            FlatButton.icon(
              onPressed: ()async{
                await _auth.SignOut();
    
              },
              icon: Icon(Icons.person),
               label: Text('Logout'),
            ),
            FlatButton.icon(
              onPressed: () => _settingbottomsheets(), 
              icon: Icon(Icons.settings), 
              label: Text('settings')
            ),
          ],
    
        ),
        body: Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage('assets/coffee_bg.png'))),
          child: brewlist()),
      ),
    );
  }
}