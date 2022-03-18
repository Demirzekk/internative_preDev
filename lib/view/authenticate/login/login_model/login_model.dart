import 'package:internative/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends BaseModel<LoginModel> {
  
  String email;
  String password;
   

  LoginModel({required this.email,required this.password,});

  @override
  Map<String, dynamic> toJson() {
    return _$LoginModelToJson(this);
  }

  @override
  LoginModel fromJson(Map<String, Object> json) {
    return _$LoginModelFromJson(json);
  }
}
