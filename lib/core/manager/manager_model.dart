import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'manager_model.g.dart';

class ManagerModel = _ManagerModelBase with _$ManagerModel;

abstract class _ManagerModelBase with Store {
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
}