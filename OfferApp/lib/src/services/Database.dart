import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String user, String name, String lastname,
      String telefono, String dob) async {
    return userCollection
        .add({
          'usuario': user,
          'nombres': name,
          'apellidos': lastname,
          'telefono': telefono,
          'fechaNacimiento': dob
        })
        .then((value) => print('User added'))
        .catchError((error) => print('Failed to add user: $error'));
  }

  Stream<QuerySnapshot> get user {
    return userCollection.snapshots();
  }
}
