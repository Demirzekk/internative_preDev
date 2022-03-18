import 'package:flutter/material.dart';
 
import 'package:internative/core/components/widgets/custom_login_buttons.dart';
import 'package:internative/core/components/widgets/textfields.dart';
import 'package:internative/core/utility/auth_shared_preferences.dart';
import 'package:internative/view/authenticate/signin/signin_view/signin_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

 
import '../../../../core/service/auth/auth_api.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextFormFieldWidget _textFormFieldWidget = TextFormFieldWidget();
  final CustomAuthButton _customAuthButton = CustomAuthButton();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthAPI _authAPI = AuthAPI();
   final UserPreferences _preferences = UserPreferences();
   
    Future<String> returnFunction()async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "Değer şuan null";
 
    return token.toString();
    
}
String sonuc="";
  @override
  void initState()  {
    _preferences.getToken();
 returnFunction().then((value){
print("İşlem başladı ve bu değer döndü: ${value.toString()}");
 });
     
    
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return buildScaffold(context);
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 250, 250, 250),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: Text(
          "Login",
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
              padding:
                  const EdgeInsets.only(top: 32.0, right: 16.0, left: 16.0),
              child: Form(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                   //   const ImageWidget(),
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
                        height: 32,
                      ),
                      _customAuthButton.customAuthButton(
                          buttonTitle: "Login",
                          buttonTitleColor: Colors.white,
                          buttonPrefixIcon: const Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                          buttonBackgroundColor: Colors.blueGrey.shade900,
                          onPressed: () async {
                            await _authAPI.signIn(_emailController.text.trim(),
                                _passwordController.text.trim(), context);
                            print(_emailController.text);
                          },
                          context: context),
                      const SizedBox(
                        height: 12,
                      ),
                      _customAuthButton.customAuthButton(
                          buttonTitle: "Register",
                          buttonTitleColor: Colors.black,
                          buttonPrefixIcon: const Icon(
                            Icons.login,
                            color: Colors.black,
                          ),
                          buttonBackgroundColor: Colors.white,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const SigninView()));
                          },
                          context: context),
                    ],
                  ),
                ),
              ),
            ),
           Container(
             margin: const EdgeInsets.only(top: 16.0),
                height: MediaQuery.of(context).size.height/1.5,
                color: Colors.white,
              ),
            
          ],
        ),
      ),
    );
  }
}

 