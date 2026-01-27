
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _loginPageState();
  
}

// ignore: camel_case_types
class _loginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("登录"),),
      body: Center(
        child: Text("登录页面")
      ),
    );
  }


}
