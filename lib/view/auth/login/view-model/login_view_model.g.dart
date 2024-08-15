// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  late final _$loginButtonStatusAtom =
      Atom(name: '_LoginViewModelBase.loginButtonStatus', context: context);

  @override
  LoginButtonStatus get loginButtonStatus {
    _$loginButtonStatusAtom.reportRead();
    return super.loginButtonStatus;
  }

  @override
  set loginButtonStatus(LoginButtonStatus value) {
    _$loginButtonStatusAtom.reportWrite(value, super.loginButtonStatus, () {
      super.loginButtonStatus = value;
    });
  }

  late final _$anonymousLoginAsyncAction =
      AsyncAction('_LoginViewModelBase.anonymousLogin', context: context);

  @override
  Future<void> anonymousLogin() {
    return _$anonymousLoginAsyncAction.run(() => super.anonymousLogin());
  }

  @override
  String toString() {
    return '''
loginButtonStatus: ${loginButtonStatus}
    ''';
  }
}
