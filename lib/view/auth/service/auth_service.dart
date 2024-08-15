import 'package:firebase_auth/firebase_auth.dart';
import 'package:tictactoe/core/constant/enum/firebase_storage_col_enum.dart';
import 'package:tictactoe/core/manager/manager.dart';
import 'package:tictactoe/view/auth/service/iauth_service.dart';

class AuthService implements IAuthService {

  // anonim giriş
  @override
  Future<User?> anonymousLogin(String displayName) async {
    try {
      var userCredential = await Manager.instance.managerModel.firebaseAuth.signInAnonymously();

      User? user = userCredential.user;
      if (user == null) throw Exception(); // validate
      await user.updateDisplayName(displayName);
      await _saveUserData(user.uid, displayName);
      return _returnUser();
    }
    catch (_) {
      await signOut();
      return null;
    }
  }

  @override
  Future<User?> autoLogin() async {
    // firebase'den uid alanını kontrol etmek gerekiyor fakat herhangi bir delete olmayacağı için basitçe geçildi
    return Manager.instance.managerModel.firebaseAuth.currentUser;
  }

  // çıkış
  @override
  Future<bool> signOut() async {
    try {
      await Manager.instance.managerModel.firebaseAuth.signOut();
      return true;
    }
    catch (_) {
      return false;
    }
  }

  // mevcut kullanıcı geri döndürülür
  Future<User?> _returnUser() async {
    return Manager.instance.managerModel.firebaseAuth.currentUser;
  }

  // kullanıcı bilgisi Users adında bir collection'a eklendi
  Future<void> _saveUserData(String uid, String displayName) async {
    await Manager.instance.managerModel.firestore.collection(FSCollectionEnum.Users.name).doc(uid).set(
      {
        "displayName": displayName
      }
    );
  }
}