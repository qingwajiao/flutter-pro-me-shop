import 'package:flutter/material.dart';
import 'package:me_shop/api/home.dart';
import 'package:me_shop/components/Home/HmCategory.dart';
import 'package:me_shop/components/Home/HmHot.dart';
import 'package:me_shop/components/Home/HmMoreList.dart';
import 'package:me_shop/components/Home/HmSlider.dart';
import 'package:me_shop/components/Home/HmSuggestion.dart';
import 'package:me_shop/contants/index.dart';
import 'package:me_shop/utils/DioRequest.dart';
import 'package:me_shop/viewmodels/home.dart';

class HmoeView extends StatefulWidget{
  const HmoeView({super.key});
  
  @override
  State<StatefulWidget> createState() => _hmoeViewState();
  
}



// ignore: camel_case_types
class _hmoeViewState extends State<HmoeView> {

  List<BannerItem> _bannerList = [];
  List<CategoryItem> _categoryList = [];
    SpecialRecommendResult _specialRecommendResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );
  List<Widget> _getHomeChildren(){
    return <Widget>[
      SliverToBoxAdapter(
        child: HmSlider(bannerList:_bannerList),
      ),
      
      SliverToBoxAdapter(
        child: SizedBox(height: 10,),
      ),
      SliverToBoxAdapter(
        child: HmCategory(categoryList: _categoryList,),
      ),
      SliverToBoxAdapter(
        child: SizedBox(height: 10,),
      ),
      
      SliverToBoxAdapter(
        child: Padding(
          padding:EdgeInsetsGeometry.symmetric(horizontal: 10), // 水平内边距10
          child: HmSuggestion(specialRecommendResult: _specialRecommendResult,)
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
  void initState() {
    // TODO: implement initState
  
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getProductList();

  }

  void _getBannerList() async{
     _bannerList = await getBannerListAPI();
      setState(() {});
    }

  void _getCategoryList() async{
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

    // 获取特惠推荐列表
  void _getProductList() async {
    _specialRecommendResult = await getProductListAPI();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getHomeChildren(),
    );
  }

}