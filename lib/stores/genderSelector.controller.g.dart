// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genderSelector.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GenderSelectorController on GenderSelectorControllerBase, Store {
  Computed<Gender?>? _$genderComputed;

  @override
  Gender? get gender =>
      (_$genderComputed ??= Computed<Gender?>(() => super.gender,
              name: 'GenderSelectorControllerBase.gender'))
          .value;

  late final _$_genderAtom =
      Atom(name: 'GenderSelectorControllerBase._gender', context: context);

  @override
  Gender? get _gender {
    _$_genderAtom.reportRead();
    return super._gender;
  }

  @override
  set _gender(Gender? value) {
    _$_genderAtom.reportWrite(value, super._gender, () {
      super._gender = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: 'GenderSelectorControllerBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$GenderSelectorControllerBaseActionController =
      ActionController(name: 'GenderSelectorControllerBase', context: context);

  @override
  bool validate() {
    final _$actionInfo = _$GenderSelectorControllerBaseActionController
        .startAction(name: 'GenderSelectorControllerBase.validate');
    try {
      return super.validate();
    } finally {
      _$GenderSelectorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGender(Gender? value) {
    final _$actionInfo = _$GenderSelectorControllerBaseActionController
        .startAction(name: 'GenderSelectorControllerBase.setGender');
    try {
      return super.setGender(value);
    } finally {
      _$GenderSelectorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isError: ${isError},
gender: ${gender}
    ''';
  }
}
