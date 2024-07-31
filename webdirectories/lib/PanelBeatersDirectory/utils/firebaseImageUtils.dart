import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

Future<String?> getImageData(String imagePath) async {
  print("getting image");
  try {
    final storageRef = FirebaseStorage.instance.ref();
    return await storageRef.child(imagePath).getDownloadURL();
  } catch (e) {
    print('Error getting image data: $e');
    return null;
  }
}
