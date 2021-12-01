import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authservices{

  FirebaseAuth _auth = FirebaseAuth.instance;
  //create object of user for diff firebase user
  User? _userbaseonfirebase(FirebaseUser user){
    
    // ignore: unnecessary_null_comparison
    return user!=null? User(uid: user.uid):null;

  }
  Stream<User?> get user{
    return _auth.onAuthStateChanged
    .map(_userbaseonfirebase);

  }

  Future tosignAnon() async{

    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userbaseonfirebase(user);

    }catch(e){
      print(e.toString());
      return null;
    }

    

  }
  Future SignOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerwithemail(String email, String password)async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await database(uid: user.uid).updatedatabase('new crew member', '0', 100);
      return _userbaseonfirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
    
  }

  Future signinwithemail(String email, String password)async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userbaseonfirebase(user);
    }catch(e){
      print(e.toString());
      return null;

    }
    

  }
}