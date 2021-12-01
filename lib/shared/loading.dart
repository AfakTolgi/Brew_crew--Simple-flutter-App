import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:SpinKitFadingCircle(
      color: Colors.brown[400],
      size: 50.0,
    ),
      
  );
  }
}