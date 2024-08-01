import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
// Import your stored user model

final storage = FlutterSecureStorage();

Future<StoredUser?> getUserInfo() async {
  String? userJson = await storage.read(key: 'user');
  if (userJson != null) {
    Map<String, dynamic> userMap = jsonDecode(userJson);
    return fromJson(userMap);
  }
  return null;
}

StoredUser fromJson(Map<String, dynamic> json) {
  return StoredUser(
    id: json['id'],
    title: json['title'],
    email: json['email'],
  );
}
