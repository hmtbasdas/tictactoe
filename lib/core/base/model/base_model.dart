import 'package:flutter/material.dart';
import 'package:tictactoe/core/init/navigation/navigation_service.dart';
import 'package:tictactoe/product/service/firestore_stream.dart';
import 'package:tictactoe/product/widget/custom_snackbar.dart';

// viewlarda kullanılan ortak yapı
mixin BaseModel {
  /// oluşturulan viewların context'i, view-model üzerinde [mContext] tanımlanır
  BuildContext? mContext;

  double dynamicHeight(BuildContext context, double value);
  double dynamicWidth(BuildContext context, double value);

  NavigationService navigation = NavigationService.instance;
  FirestoreStream firestoreStream = FirestoreStream();
  CustomSnackBar customSnackBar = CustomSnackBar();

  void setContext(BuildContext context);
  void init();
}