import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid, displayName;

  UserModel({ this.uid, this.displayName });

  factory UserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options,) {
    final data = snapshot.data();
    return UserModel(
      uid: data?['uid'],
      displayName: data?['displayName'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) "uid": uid,
      if (displayName != null) "displayName": displayName,
    };
  }
}