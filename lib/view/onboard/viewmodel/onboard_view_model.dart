import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_modal.dart';

 
part 'onboard_view_model.g.dart';
 
 

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store,BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init(){}
}