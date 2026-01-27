import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget{
  const HmCategory({super.key});
  
  @override
  State<StatefulWidget> createState() => _HmCategoryState();
  
}

// ignore: camel_case_types
class _HmCategoryState extends State<HmCategory> {

  @override
  Widget build(BuildContext context) {
  // return ListView();
    // 返回一个横向滚动的组件
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            width: 80,
            height: 100,
            color: Colors.blue,
            child: Text("分类$index", style: TextStyle(color: Colors.white)),
            margin: EdgeInsets.symmetric(horizontal: 10),
          );
        },
      ),
    );
     
}
}
