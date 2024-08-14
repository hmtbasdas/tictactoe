import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthService {
  Future<dynamic> autoLogin(String uid);
  Future<dynamic> anonymousLogin(String username);
}