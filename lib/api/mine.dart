// 猜你喜欢有参数
// page: 1 pageSize: 10
import 'package:me_shop/contants/index.dart';
import 'package:me_shop/utils/DioRequest.dart';
import 'package:me_shop/viewmodels/mine.dart';

Future<GoodsDetailsItems> getGuessListAPI(Map<String, dynamic> params) async {
  return GoodsDetailsItems.formJSON(
    await dioRequest.get(HttpConstants.GUESS_LIST, params: params),
  );
}