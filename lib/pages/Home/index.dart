import 'package:flutter/material.dart';
import 'package:me_shop/api/home.dart';
import 'package:me_shop/components/Home/HmCategory.dart';
import 'package:me_shop/components/Home/HmHot.dart';
import 'package:me_shop/components/Home/HmMoreList.dart';
import 'package:me_shop/components/Home/HmSlider.dart';
import 'package:me_shop/components/Home/HmSuggestion.dart';
import 'package:me_shop/contants/index.dart';
import 'package:me_shop/utils/DioRequest.dart';
import 'package:me_shop/utils/ToastUtils.dart';
import 'package:me_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget{
  const HomeView({super.key});
  
  @override
  State<StatefulWidget> createState() => _homeViewState();
  
}



// ignore: camel_case_types
class _homeViewState extends State<HomeView> {

  List<BannerItem> _bannerList = [];
  List<CategoryItem> _categoryList = [];
  SpecialRecommendResult _specialRecommendResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );

    // 热榜推荐
  SpecialRecommendResult _inVogueResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );
  // 一站式推荐
  SpecialRecommendResult _oneStopResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );
  List<GoodDetailItem> _recommendList = [];

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
            Expanded(child: HmHot(result: _specialRecommendResult, type: "hot")),
            SizedBox(width: 10,),
            Expanded(child: HmHot(result: _specialRecommendResult,type: "step")),
          ],
          ),),
      ),
      SliverToBoxAdapter(
        child: SizedBox(height: 10,),
      ),

      HmMoreList(recommendList: _recommendList),

    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _registerEvent();
    Future.microtask(()  {
      _refreshKey.currentState?.show();
    });
  }

  // 注册滚动控制器
  void _registerEvent(){
    _controller.addListener(() {
      if(_controller.position.pixels >= (_controller.position.maxScrollExtent -50)) {
        _getRecommendList();
      }
    });
  }

  Future<void> _getBannerList() async{
     _bannerList = await getBannerListAPI();
    }

  Future<void> _getCategoryList() async{
    _categoryList = await getCategoryListAPI();
  }

    // 获取特惠推荐列表
  Future<void> _getProductList() async {
    _specialRecommendResult = await getProductListAPI();
  }

  
  // 获取热榜推荐列表
  Future<void> _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
  }

  // 获取一站式推荐列表
  Future<void> _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
  }

  // 获取推荐列表
  bool isLoading = false; // 是否正在加载数据
  bool hasMore = true; // 是否有更多数据
  int _page = 1; // 当前页码
  Future<void> _getRecommendList() async {
      if(isLoading || !hasMore)  {
        return; // 如果正在加载数据或没有更多数据，直接返回
      }
    isLoading = true; // 设置正在加载数据
    int requestLimit = _page * 8; // 每次请求的数据量
    _recommendList = await getRecommendListAPI({"limit": requestLimit});
    isLoading = false; // 数据加载完成
    _page++; // 页码加1
    if (_recommendList.length < requestLimit) {
      hasMore = false; // 如果返回的数据少于请求的数量，说明没有更多数据
    }
  }

  Future _onRefresh() async {
    _paddingTop = 30;
    setState(() {});
    _page = 1;
    hasMore = true;
    isLoading = false;
    await _getBannerList();
    await _getCategoryList();
    await _getProductList();
    await _getInVogueList();
    await _getOneStopList();
    await _getRecommendList();
    _paddingTop = 0;
    setState(() {});
    ToastUtils.showToast(context,"刷新完成");
  }

  GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey<RefreshIndicatorState>();
  final ScrollController _controller = ScrollController();
  double _paddingTop = 0;
  @override
  Widget build(BuildContext context) {
    
    return RefreshIndicator(
      key: _refreshKey,
      onRefresh: _onRefresh, 
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        padding: EdgeInsets.only(top: _paddingTop),
        child: CustomScrollView(
          controller: _controller,
          slivers: _getHomeChildren(),
    ))
,
    );
  }

}