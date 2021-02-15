import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sreecoffe/screen/home/brew.dart';
import 'package:sreecoffe/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference

  final CollectionReference brewcollection =
      FirebaseFirestore.instance.collection('brews');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await brewcollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
    // print(brewcollection.doc(uid));
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data()['name'],
        sugar: snapshot.data()['sugars'],
        strength: snapshot.data()['strength']);
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return Brew(
          name: doc.data()['name'] ?? '',
          strength: doc.data()['strength'] ?? 0,
          sugars: doc.data()['sugars'] ?? '0');
    }).toList();
  }

//get brews stream
  Stream<List<Brew>> get brews {
    return brewcollection.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData> get userData {
    return brewcollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
