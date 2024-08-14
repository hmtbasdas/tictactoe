import 'package:firebase_auth/firebase_auth.dart';
import 'package:tictactoe/view/auth/service/iauth_service.dart';

class AuthService implements IAuthService {
  @override
  Future<dynamic> anonymousLogin() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print(userCredential);
    } catch (error) {
      print(error);
    }
  }

  @override
  Future autoLogin(String authToken) {
    // TODO: implement autoLogin
    throw UnimplementedError();
  }

}

// UserCredential(additionalUserInfo: AdditionalUserInfo(isNewUser: true, profile: {}, providerId: null, username: null, authorizationCode: null), credential: null, user: User(displayName: null, email: null, isEmailVerified: false, isAnonymous: true, metadata: UserMetadata(creationTime: 2024-08-14 00:56:02.938Z, lastSignInTime: 2024-08-14 00:56:02.938Z), phoneNumber: null, photoURL: null, providerData, [], refreshToken: AMf-vBzf0JVUIBYCWrcb3b49cldutb8fqOZoLxZxMNbY1oFYa-cSHkGtsmPyO58frurbwHpfQaYqdQEX-abZqX37lEM6DUdDTh3CP-_erLddFJPpX3Nfc2-PiEtbnBviTbv4Bhhggq1NtpE_j05t0BxsYzPjTf4CKagFt1dwmjjPGm6_XyR2ySaEYZSN4uhDVGeMeoYRp4Cx, tenantId: null, uid: KrpZvsgNYZcSm0J6IhL24FryKKR2))
