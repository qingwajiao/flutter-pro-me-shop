import 'package:flutter/material.dart';
import 'package:me_shop/components/Home/HmCategory.dart';
import 'package:me_shop/components/Home/HmHot.dart';
import 'package:me_shop/components/Home/HmMoreList.dart';
import 'package:me_shop/components/Home/HmSlider.dart';
import 'package:me_shop/components/Home/HmSuggestion.dart';
import 'package:me_shop/viewmodels/home.dart';

class HmoeView extends StatefulWidget{
  const HmoeView({super.key});
  
  @override
  State<StatefulWidget> createState() => _hmoeViewState();
  
}



// ignore: camel_case_types
class _hmoeViewState extends State<HmoeView> {

    final  List<BannerItem> _bannerList = <BannerItem>[
        BannerItem(
      id: "1",
      imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
    ),
    BannerItem(
      id: "2",
      imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png",
    ),
    BannerItem(
      id: "3",
      imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg",
    ),
  ];

  List<Widget> _getHomeChildren(){
    return <Widget>[
      SliverToBoxAdapter(
        child: HmSlider(bannerList:_bannerList),
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