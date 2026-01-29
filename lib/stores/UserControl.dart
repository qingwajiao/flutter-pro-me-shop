import 'package:get/get.dart';
import 'package:me_shop/viewmodels/user.dart';

class UserController extends GetxController {
  var user = UserInfo.fromJSON({}).obs;

  void updateUserInfo( UserInfo userInfo) {
    user.value = userInfo;
  }

}