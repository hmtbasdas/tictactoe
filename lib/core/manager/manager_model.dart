import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'manager_model.g.dart';

class ManagerModel = _ManagerModelBase with _$ManagerModel;

abstract class _ManagerModelBase with Store {
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

}