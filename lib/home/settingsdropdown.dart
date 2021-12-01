import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constant.dart';
import 'package:provider/provider.dart';

class settingsdropdown extends StatefulWidget {

  @override
  _settingsdropdownState createState() => _settingsdropdownState();
}

class _settingsdropdownState extends State<settingsdropdown> {
  final _formkey = GlobalKey<FormState>();
  final List<String>sugars = ['0','1','2','3','4','5'];

  late String _curr_name = '';
  late String _curr_sugar = '0';
  int _curr_streng = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<Userdata>(
      stream: database(uid: user.uid).userdata,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          Userdata? userdata = snapshot.data;
          return Form(
            key: _formkey,
            child: Column(
              children: [
                Text(
                  'Update your settings',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  initialValue: userdata!.name,
                  decoration: textinput,
                  validator: (val)=> val!.isEmpty? 'Enter name':null,
                  onChanged: (val) => setState(() => _curr_name = val),
                ),
                SizedBox(height: 20.0,),
                DropdownButtonFormField<String>(
                  value: _curr_sugar=='0'?userdata.sugar:_curr_sugar,
                  
                  items: sugars.map((sugar){
                    return DropdownMenuItem<String>(
                      value: sugar,
                      child: Text('$sugar sugars'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() => _curr_sugar = val!);
                  },
                  
                ),
                SizedBox(height: 20.0,),
                Slider(
                  value: (_curr_streng==0?userdata.strength:_curr_streng).toDouble(),
                  min: 100,
                  max: 900,
                  divisions: 8,
                  activeColor: Colors.brown[(_curr_streng)], 
                  inactiveColor: Colors.brown[(_curr_streng)],
                  onChanged: (val){
                    setState(() => _curr_streng = val.round());
                  }),
                SizedBox(height: 20.0,),
                RaisedButton(
                  color: Colors.brown[400],
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: ()async{
                    if (_formkey.currentState!.validate()){
                      await database(uid: user.uid).updatedatabase(
                      _curr_name == ''?userdata.name:_curr_name,
                      _curr_sugar == '0'?userdata.sugar:_curr_sugar, 
                      _curr_streng == 0?userdata.strength:_curr_streng);
                    }
                    Navigator.pop(context);
                    
                  })
              ],
            ),
          );

        }else{

          return loading();
        }
          
      }
    );
  }
}