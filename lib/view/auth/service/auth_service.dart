import 'package:firebase_auth/firebase_auth.dart';
import 'package:tictactoe/view/auth/service/iauth_service.dart';

class AuthService implements IAuthService {
  @override
  Future anonymousLogin() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (error) {
      print(error);
    }
  }

  @override
  Future autoLogin(String authToken) {
    // TODO: implement autoLogin
    throw UnimplementedError();
  }

}
