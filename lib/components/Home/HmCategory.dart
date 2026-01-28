import 'package:flutter/material.dart';
import 'package:me_shop/viewmodels/home.dart';

class HmCategory extends StatefulWidget{
  final List<CategoryItem> categoryList;
  HmCategory({Key? key, required this.categoryList}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _HmCategoryState();
  
}

// todo 横向还不能滑动
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
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          final category = widget.categoryList[index];
          return Container(
            alignment: Alignment.center,
            width: 80,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 231, 232, 234), 
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(category.picture, width: 40, height: 40),
                Text(category.name, style: TextStyle(color: Colors.black)),
              ],
            ),
          );
        },
      ),
    );
     
}
}
