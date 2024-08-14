import 'package:flutter/material.dart';
import 'package:tictactoe/core/init/navigation/navigation_service.dart';
import 'package:tictactoe/core/init/storage/storage_manager.dart';
import 'package:tictactoe/product/widget/custom_snackbar.dart';

mixin BaseModel {
  BuildContext? mContext;

  double dynamicHeight(BuildContext context, double value);
  double dynamicWidth(BuildContext context, double value);

  StorageManager storageManager = StorageManager.instance;
  NavigationService navigation = NavigationService.instance;
  CustomSnackBar customSnackBar = CustomSnackBar();

  void setContext(BuildContext context);
  void init();
}