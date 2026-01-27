import 'package:flutter/material.dart';

class MineView extends StatefulWidget{
  const MineView({super.key});
  
  @override
  State<StatefulWidget> createState() => _mineViewState();
  
}

// ignore: camel_case_types
class _mineViewState extends State<MineView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("我的"),
      ),
    );
  }

}