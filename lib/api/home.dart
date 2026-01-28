
import 'package:me_shop/contants/index.dart';
import 'package:me_shop/utils/DioRequest.dart';
import 'package:me_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async{
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
    item,
  ) {
    return BannerItem.formJSON(item as Map<String, dynamic>);
  }).toList();
  }

// 获取分类数据
Future<List<CategoryItem>> getCategoryListAPI() async{
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((
    item,
  ) {
    return CategoryItem.formJSON(item as Map<String, dynamic>);
  }).toList();
  }

// 特惠推荐
Future<SpecialRecommendResult> getProductListAPI() async {
  // 返回请求
  return SpecialRecommendResult.formJSON(
    await dioRequest.get(HttpConstants.PRODUCT_LIST),
  );
}

// 热榜推荐
Future<SpecialRecommendResult> getInVogueListAPI() async {
  // 返回请求
  return SpecialRecommendResult.formJSON(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

// 一站式推荐
Future<SpecialRecommendResult> getOneStopListAPI() async {
  // 返回请求
  return SpecialRecommendResult.formJSON(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}

// 推荐列表
Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  // 返回请求
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, params: params))
          as List)
      .map((item) {
        return GoodDetailItem.formJSON(item as Map<String, dynamic>);
      })
      .toList();
}