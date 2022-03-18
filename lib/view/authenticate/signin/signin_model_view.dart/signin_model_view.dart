import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_modal.dart';

 part 'signin_model_view.g.dart';

class SigninViewModel = _SigninViewModelBase with _$SigninViewModel;

abstract class _SigninViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {}

  @observable
  String? name;

  @action
  void changeName(String name) {
    this.name = name;
  }
}
