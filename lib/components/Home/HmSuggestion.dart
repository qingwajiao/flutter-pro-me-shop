import 'package:flutter/material.dart';

class HmSuggestion extends StatefulWidget{
  const HmSuggestion({super.key});
  
  @override
  State<StatefulWidget> createState() => _HmSuggestionState();
  
}

// ignore: camel_case_types
class _HmSuggestionState extends State<HmSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center, // 纵向居中
      height: 200,
      color: Colors.blue,
      child: Center(child: Text("特惠推荐"),
      ),
    );
}
}