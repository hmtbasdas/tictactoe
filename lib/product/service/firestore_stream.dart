import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tictactoe/core/constant/enum/firebase_storage_col_enum.dart';
import 'package:tictactoe/core/manager/manager.dart';
import 'package:tictactoe/product/model/game_model.dart';

class FirestoreStream {
  late StreamSubscription<QuerySnapshot> _listenGamesStreamSubscription;

  void listenGames() {
    try {
      final gamesDocRef = Manager.instance.managerModel.firestore.collection(FSCollectionEnum.Games.name);
      _listenGamesStreamSubscription = gamesDocRef.snapshots().listen((QuerySnapshot querySnapshot) async {
        for (var element in querySnapshot.docChanges) {
          final gameData = element.doc.data() as Map<String, dynamic>;
          Manager.instance.managerModel.updateGameList(GameModel.to(gameData), element.type);
        }
      });
    } on FirebaseException catch (_) {}
  }

  void listenPlayground(String gameName, Function function) {
    try {
      final gamesDocRef = Manager.instance.managerModel.firestore
          .collection(FSCollectionEnum.Games.name)
          .doc(gameName)
          .collection(FSCollectionEnum.Playground.name);
      _listenGamesStreamSubscription = gamesDocRef.snapshots().listen((QuerySnapshot querySnapshot) async {
        for (var element in querySnapshot.docChanges) {
          final playgroundData = element.doc.data() as Map<String, dynamic>;
          function(playgroundData, element.type);
        }
      });
    } on FirebaseException catch (_) {}
  }
}
