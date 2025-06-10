import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class WatifStorage {
  static const _storage = FlutterSecureStorage();

  // Keys for storage
  static const String _isLoggedInKey = 'watif_is_logged_in';
  static const String _userDataKey = 'watif_user_data';
  static const String _loginTimestampKey = 'watif_login_timestamp';

  /// Check if user is logged in
  static Future<bool> isLoggedIn() async {
    try {
      final isLoggedIn = await _storage.read(key: _isLoggedInKey);
      final timestamp = await _storage.read(key: _loginTimestampKey);

      if (isLoggedIn == 'true' && timestamp != null) {
        // Check if login is still valid (e.g., within 30 days)
        final loginTime =
            DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
        final now = DateTime.now();
        final difference = now.difference(loginTime).inDays;

        // If login is older than 30 days, consider it expired
        if (difference > 30) {
          await logout();
          return false;
        }

        return true;
      }
      return false;
    } catch (e) {
      print('Error checking login status: $e');
      return false;
    }
  }

  /// Save login state and user data
  static Future<void> saveLoginState({
    required String email,
    String? displayName,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      final userData = {
        'email': email,
        'displayName': displayName ?? '',
        'loginTimestamp': DateTime.now().millisecondsSinceEpoch,
        ...?additionalData,
      };

      await _storage.write(key: _isLoggedInKey, value: 'true');
      await _storage.write(key: _userDataKey, value: jsonEncode(userData));
      await _storage.write(
          key: _loginTimestampKey,
          value: DateTime.now().millisecondsSinceEpoch.toString());

      print('Login state saved for user: $email');
    } catch (e) {
      print('Error saving login state: $e');
    }
  }

  /// Get stored user data
  static Future<Map<String, dynamic>?> getUserData() async {
    try {
      final userDataString = await _storage.read(key: _userDataKey);
      if (userDataString != null) {
        return Map<String, dynamic>.from(jsonDecode(userDataString));
      }
      return null;
    } catch (e) {
      print('Error getting user data: $e');
      return null;
    }
  }

  /// Clear login state (logout)
  static Future<void> logout() async {
    try {
      await _storage.delete(key: _isLoggedInKey);
      await _storage.delete(key: _userDataKey);
      await _storage.delete(key: _loginTimestampKey);
      print('User logged out - all data cleared');
    } catch (e) {
      print('Error during logout: $e');
    }
  }

  /// Update user data without affecting login state
  static Future<void> updateUserData(Map<String, dynamic> newData) async {
    try {
      final currentData = await getUserData() ?? {};
      final updatedData = {...currentData, ...newData};

      await _storage.write(key: _userDataKey, value: jsonEncode(updatedData));
      print('User data updated');
    } catch (e) {
      print('Error updating user data: $e');
    }
  }

  /// Get specific user property
  static Future<String?> getUserProperty(String key) async {
    try {
      final userData = await getUserData();
      return userData?[key]?.toString();
    } catch (e) {
      print('Error getting user property $key: $e');
      return null;
    }
  }
}
