// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_model_view.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SigninViewModel on _SigninViewModelBase, Store {
  final _$nameAtom = Atom(name: '_SigninViewModelBase.name');

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$_SigninViewModelBaseActionController =
      ActionController(name: '_SigninViewModelBase');

  @override
  void changeName(String name) {
    final _$actionInfo = _$_SigninViewModelBaseActionController.startAction(
        name: '_SigninViewModelBase.changeName');
    try {
      return super.changeName(name);
    } finally {
      _$_SigninViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name}
    ''';
  }
}
