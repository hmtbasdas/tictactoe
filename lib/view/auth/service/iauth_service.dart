abstract class IAuthService {
  Future<dynamic> autoLogin();
  Future<dynamic> anonymousLogin(String displayName);
  Future<dynamic> signOut();
}