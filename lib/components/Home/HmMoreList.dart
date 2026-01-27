import 'package:flutter/material.dart';

class HmMorelist extends StatefulWidget{
  const HmMorelist({super.key});
  
  @override
  State<StatefulWidget> createState() => _HmMorelistState();
  
}

// ignore: camel_case_types
class _HmMorelistState extends State<HmMorelist> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 50,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        // childAspectRatio: 0.75, // 宽高比
      ),
      itemBuilder: (context, index) {
        return Container(
            alignment: Alignment.center,
            color: Colors.blue,
            child: Text("$index 号商品",style: TextStyle(color: Colors.white),),
        );
      },
    );
}
}
