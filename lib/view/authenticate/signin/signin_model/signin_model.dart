import 'package:internative/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signin_model.g.dart';

@JsonSerializable()
class SignModel extends BaseModel<SignModel> {
  
  String email;
  String password;
   

  SignModel({required this.email,required this.password,});

  @override
  Map<String, dynamic> toJson() {
    return _$SignModelToJson(this);
  }

  @override
  SignModel fromJson(Map<String, Object> json) {
    return _$SignModelFromJson(json);
  }
}
