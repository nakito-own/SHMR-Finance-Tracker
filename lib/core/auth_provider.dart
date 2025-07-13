class AuthProvider {
  static const apiToken = String.fromEnvironment('API_TOKEN');

  Future<String> getToken() async {
    return apiToken;
  }
}
