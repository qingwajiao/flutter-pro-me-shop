import 'package:flutter/material.dart';
import 'package:me_shop/components/Home/HmCategory.dart';
import 'package:me_shop/components/Home/HmHot.dart';
import 'package:me_shop/components/Home/HmMoreList.dart';
import 'package:me_shop/components/Home/HmSlider.dart';
import 'package:me_shop/components/Home/HmSuggestion.dart';

class HmoeView extends StatefulWidget{
  const HmoeView({super.key});
  
  @override
  State<StatefulWidget> createState() => _hmoeViewState();
  
}

// ignore: camel_case_types
class _hmoeViewState extends State<HmoeView> {

  List<Widget> _getHomeChildren(){
    return <Widget>[
      SliverToBoxAdapter(
        child: HmSlider(),
      ),
      
      SliverToBoxAdapter(
        child: SizedBox(height: 10,),
      ),
      SliverToBoxAdapter(
        child: HmCategory(),
      ),
      SliverToBoxAdapter(
        child: SizedBox(height: 10,),
      ),
      
      SliverToBoxAdapter(
        child: Padding(
          padding:EdgeInsetsGeometry.symmetric(horizontal: 10), // 水平内边距10
          child: HmSuggestion()
        ),
      ),

      SliverToBoxAdapter(
        child: SizedBox(height: 10,),
      ),

      SliverToBoxAdapter(
        child: Padding(
          padding:EdgeInsetsGeometry.symmetric(horizontal: 10), // 水平内边距10
          child:Flex(
          direction: Axis.horizontal, // 水平方向
          children: [
            Expanded(child: HmHot()),
            SizedBox(width: 10,),
            Expanded(child: HmHot()),
          ],
          ),),
      ),
      SliverToBoxAdapter(
        child: SizedBox(height: 10,),
      ),

      HmMorelist(),

    ];
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getHomeChildren(),
    );
  }

}