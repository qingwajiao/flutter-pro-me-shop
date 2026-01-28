
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