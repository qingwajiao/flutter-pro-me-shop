import 'package:flutter/material.dart';

class HmoeView extends StatefulWidget{
  const HmoeView({super.key});
  
  @override
  State<StatefulWidget> createState() => _hmoeViewState();
  
}

// ignore: camel_case_types
class _hmoeViewState extends State<HmoeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("首页"),
      ),
    );
  }

}