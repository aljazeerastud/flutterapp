import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:awa/core/storage/data/storage.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class StorageImpl implements Storage {
  final  FlutterSecureStorage secureStorage;
  final Box<String> stringBox;
  final Box<bool> boolBox;

  static const String _token = "token";
  static const String _language = "language";

  StorageImpl({required this.boolBox, required this.stringBox, required this.secureStorage});

  // Token Storage
  @override
  Future<void> storeToken({required String token}) async{
    await secureStorage.write(key: _token, value: token);
  }

  @override
  Future<String?> getToken() async {
    String? token = await secureStorage.read(key: _token);
    return token;
  }

  @override
  Future<void> deleteToken() async{
    await secureStorage.delete(key: _token);
    return;
  }

  // Check Token
 @override
Future<bool> isAuthorized() async {
  final token = await getToken();
  if (token == null) {
    print('Token is null');
    return false;
  }

  try {
    final isExpired = JwtDecoder.isExpired(token);
    print('Token Expired: $isExpired');
    return !isExpired;
  } catch (e) {
    print('Error decoding token: $e');
    return false; // Treat any error as unauthorized
  }
}


  // Language Storage
  @override
  void storeLang({required String langCode}) {
    stringBox.put(_language, langCode);
  }

  @override
  String getLang() {
    return stringBox.get(_language) ?? "en";
  }

  @override
  void deleteLang() {
    stringBox.delete(_language);
  }

  // Check Select Language
  @override
  bool isSelectLang() {
    String? val = stringBox.get(_language);
    return val != null;
  }
  
}
