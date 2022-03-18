import 'package:flutter/material.dart';
 
import 'package:internative/view/onboard/viewmodel/onboard_view_model.dart';

import '../../../core/base/view/base_view.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model){
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel value){
 return Scaffold(appBar: AppBar(),body: Column(
   children: [
 Expanded(flex:5,child: Container(color: Colors.red,)),
 Expanded(flex: 3, child: Container(color: Colors.blue,)),
 Expanded(flex:1,child: Container(color: Colors.yellow,)),
   ],
 ),);
      },
    );
  }
}