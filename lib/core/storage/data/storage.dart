abstract class Storage {
  // Token Storage
  Future<void> storeToken({required String token});
  Future<String?> getToken();
  Future<void> deleteToken();

  // Check Token
  Future<bool> isAuthorized();

  // Language Storage
  void storeLang({required String langCode});
  String getLang();
  void deleteLang();

  // Check Language
  bool isSelectLang();
}
