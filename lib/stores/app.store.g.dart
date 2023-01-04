// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on AppStoreBase, Store {
  Computed<bool>? _$isAuthComputed;

  @override
  bool get isAuth => (_$isAuthComputed ??=
          Computed<bool>(() => super.isAuth, name: 'AppStoreBase.isAuth'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: 'AppStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$tokensAtom = Atom(name: 'AppStoreBase.tokens', context: context);

  @override
  TokensModel get tokens {
    _$tokensAtom.reportRead();
    return super.tokens;
  }

  @override
  set tokens(TokensModel value) {
    _$tokensAtom.reportWrite(value, super.tokens, () {
      super.tokens = value;
    });
  }

  late final _$initDeviceIdAsyncAction =
      AsyncAction('AppStoreBase.initDeviceId', context: context);

  @override
  Future initDeviceId() {
    return _$initDeviceIdAsyncAction.run(() => super.initDeviceId());
  }

  late final _$setTokensAsyncAction =
      AsyncAction('AppStoreBase.setTokens', context: context);

  @override
  Future setTokens(TokensModel tokensModel) {
    return _$setTokensAsyncAction.run(() => super.setTokens(tokensModel));
  }

  late final _$signInAsyncAction =
      AsyncAction('AppStoreBase.signIn', context: context);

  @override
  Future signIn({required String email, required String password}) {
    return _$signInAsyncAction
        .run(() => super.signIn(email: email, password: password));
  }

  late final _$logOutAsyncAction =
      AsyncAction('AppStoreBase.logOut', context: context);

  @override
  Future logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  late final _$AppStoreBaseActionController =
      ActionController(name: 'AppStoreBase', context: context);

  @override
  dynamic initTokensFromStorage() {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.initTokensFromStorage');
    try {
      return super.initTokensFromStorage();
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoading(bool value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
tokens: ${tokens},
isAuth: ${isAuth}
    ''';
  }
}
