import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStorageService extends ChangeNotifier{
  FirebaseStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
  Future<Widget> getImage(BuildContext context, String imageName) async {
    Image image;
    await FirebaseStorageService.loadImage(context, imageName).then((value){
      image = Image.network(value.toString(), fit: BoxFit.fill,);
    });
    return image;
  }
}

