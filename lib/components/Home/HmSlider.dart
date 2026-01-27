import 'package:flutter/material.dart';

class HmSlider extends StatefulWidget{
  const HmSlider({super.key});
  
  @override
  State<StatefulWidget> createState() => _HmSliderState();
  
}

// ignore: camel_case_types
class _HmSliderState extends State<HmSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center, // 纵向居中
      height: 200,
      color: Colors.blue,
      child: Center(child: Text("轮播图"),
      ),
    );
}
}
