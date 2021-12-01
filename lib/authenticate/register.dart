import 'package:brew_crew/shared/constant.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/services/auth.dart';

class register extends StatefulWidget {
  final Function toggleview;
  register({required this.toggleview});

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  bool isloading = false;
  final _formkey = GlobalKey<FormState>();

  final authservices _auth = authservices();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return isloading? loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Register in to brew'),
        elevation: 0.0,
        actions: [
          FlatButton.icon(
            onPressed: (){
              widget.toggleview();
            }, 
            icon: Icon(Icons.settings), 
            label: Text('Sign in'))
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textinput.copyWith(hintText: 'Email'),
                  validator: (val)=> val!.isEmpty? 'Enter email': null,
                  onChanged: (val){
                    setState(() => email = val);
                    
          
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textinput.copyWith(hintText: 'Password'),
                  validator: (val) => val!.length<6? 'Enter max': null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() => password = val);
          
                  },
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.brown[400],
                  onPressed: ()async{
                    if(_formkey.currentState!.validate()){
                      setState(() => isloading = true);
                      dynamic result = await _auth.registerwithemail(email, password);
                      if (result == null){
                        setState(() { 
                          error = 'Enter valid credentials';
                          isloading = false;
                          });

                      }
                    }
                  }
                ),
                SizedBox(height: 20.0,),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.brown[700],
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}