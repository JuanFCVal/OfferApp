import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

class FirebaseStorageService extends ChangeNotifier {
  FirebaseStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await firebase_storage.FirebaseStorage.instance
        .ref('profilePics')
        .child(Image)
        .getDownloadURL();
  }
}

FirebaseStorageService fbstorageObject = new FirebaseStorageService();
