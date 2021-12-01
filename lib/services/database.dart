import 'package:brew_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/brews.dart';

class database {
  final String uid;
  database({this.uid=''});

  final CollectionReference brewcrews = Firestore.instance.collection('brews');

  Future updatedatabase(String name, String sugar, int strength)async{
    return await brewcrews.document(uid).setData({
      'name':name,
      'sugar': sugar,
      'strength': strength,

    });
  }


  List<brew> _brewlistfromsnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return brew(
        name: doc.data['name'] ?? '', 
        sugar: doc.data['sugar'] ?? '0', 
        strenght: doc.data['strength'] ?? 100,
      );
    }).toList();

    
  }
  Userdata _userdatabase(DocumentSnapshot snapshot){
    return Userdata(
      uid: uid,
      name: snapshot.data['name'],
      sugar:snapshot.data['sugar'],
      strength:snapshot.data['strength']
    );
  }


  Stream<List<brew>> get brews {
    return brewcrews.snapshots()
    .map(_brewlistfromsnapshot);
    
  }

  Stream<Userdata> get userdata{
    return brewcrews.document(uid).snapshots()
    .map(_userdatabase);
  }
}