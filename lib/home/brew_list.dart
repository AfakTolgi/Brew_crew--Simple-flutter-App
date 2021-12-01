import 'package:brew_crew/models/Brewtile.dart';
import 'package:brew_crew/models/brews.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class brewlist extends StatefulWidget {

  @override
  _brewlistState createState() => _brewlistState();
}

class _brewlistState extends State<brewlist> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<brew>>(context)??[];
    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index){
        return brewtile(brews: brews[index],);
      });
  }
}