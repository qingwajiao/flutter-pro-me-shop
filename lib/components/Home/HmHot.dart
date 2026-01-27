import 'package:flutter/material.dart';

class HmHot extends StatefulWidget{
  const HmHot({super.key});
  
  @override
  State<StatefulWidget> createState() => _HmHotState();
  
}

// ignore: camel_case_types
class _HmHotState extends State<HmHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center, // 纵向居中
      height: 200,
      color: Colors.blue,
      child: Center(child: Text("热门"),
      ),
    );
}
}
