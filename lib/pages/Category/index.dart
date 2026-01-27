import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget{
  const CategoryView({super.key});
  
  @override
  State<StatefulWidget> createState() => _categoryViewState();
  
}

// ignore: camel_case_types
class _categoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("分类"),
      ),
    );
  }

}