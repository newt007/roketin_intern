import 'package:flutter/material.dart';
import 'package:roketin_intern/modules/login/login_screen.dart';
import 'package:roketin_intern/modules/register/register_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({ Key? key }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  bool isLogin = true;
  
  @override
  Widget build(BuildContext context) {
    return isLogin ? LoginScreen(onClickedSignUp: toggle) : RegisterScreen(onClickedSignIn: toggle,);
  }

  void toggle() => setState(() {
    isLogin = !isLogin;
  });

}