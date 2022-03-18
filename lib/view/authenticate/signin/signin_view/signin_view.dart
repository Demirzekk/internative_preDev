import 'package:flutter/material.dart';
 
import 'package:internative/core/components/widgets/custom_login_buttons.dart';
import 'package:internative/core/components/widgets/textfields.dart';
import 'package:internative/core/service/auth/auth_api.dart';
 
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/base/view/base_view.dart';
import '../signin_model_view.dart/signin_model_view.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextFormFieldWidget _textFormFieldWidget = TextFormFieldWidget();
  final CustomAuthButton _customAuthButton = CustomAuthButton();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final AuthAPI _authAPI = AuthAPI();
  @override
  void initState()  {
   Future.microtask(() => get());
    super.initState();
  }
  get()async{
 final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token =   prefs.getString("token");
    print(token);
  }
  @override
  
  Widget build(BuildContext context) {
    return BaseView<SigninViewModel>(
        viewModel: SigninViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, SigninViewModel value) =>
            Scaffold(
              backgroundColor: const Color.fromARGB(250, 250, 250, 250),
              appBar: AppBar(
                elevation: 2,
                backgroundColor: Colors.white,
                title: Text(
                  "SignUp",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 32.0, right: 16.0, left: 16.0),
                      child: Form(
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                        //      const ImageWidget(),
                              const SizedBox(
                                height: 32,
                              ),
                              _textFormFieldWidget.emailTextFormField(
                                  controller: _emailController,
                                  prefixEmailIcon: const Icon(Icons.email),
                                  hintText: "Email"),
                              const SizedBox(
                                height: 12,
                              ),
                              _textFormFieldWidget.passwordTextFormField(
                                  controller: _passwordController,
                                  prefixPasswordIcon: const Icon(Icons.email),
                                  suffixVisibleIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.visibility)),
                                  hintText: "Password"),
                              const SizedBox(
                                height: 12,
                              ),
                              _textFormFieldWidget.passwordTextFormField(
                                  controller: _rePasswordController,
                                  prefixPasswordIcon: const Icon(Icons.email),
                                  suffixVisibleIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.visibility)),
                                  hintText: "Re-Password"),
                              const SizedBox(
                                height: 32,
                              ),
                              _customAuthButton.customAuthButton(
                                  buttonTitle: "Register",
                                  buttonTitleColor: Colors.white,
                                  buttonPrefixIcon: const Icon(
                                    Icons.login,
                                    color: Colors.white,
                                  ),
                                  buttonBackgroundColor:
                                      Colors.blueGrey.shade900,
                                  onPressed: () async {
                                    await _authAPI.register(
                                        _emailController.text,
                                        _passwordController.text,
                                        _rePasswordController.text,
                                        context);
                                  },
                                  context: context),
                              const SizedBox(
                                height: 12,
                              ),
                              _customAuthButton.customAuthButton(
                                  buttonTitle: "Login",
                                  buttonTitleColor: Colors.black,
                                  buttonPrefixIcon: const Icon(
                                    Icons.login,
                                    color: Colors.black,
                                  ),
                                  buttonBackgroundColor: Colors.white,
                                  onPressed: () async {},
                                  context: context),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: double.maxFinite,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ));
  }
}
