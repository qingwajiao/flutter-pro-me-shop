import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me_shop/api/user.dart';
import 'package:me_shop/pages/Cart/index.dart';
import 'package:me_shop/pages/Category/index.dart';
import 'package:me_shop/pages/Home/index.dart';
import 'package:me_shop/pages/Mine/index.dart';
import 'package:me_shop/stores/TokenManager.dart';
import 'package:me_shop/stores/UserControl.dart';

// 创建一个有状态的类

class MainPage extends StatefulWidget{
  const MainPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _mainPageState();
  
}

  int _currentIndex = 0;
// ignore: camel_case_types
class _mainPageState extends State<MainPage> {
  
  final List<Map<String,String>> _tabList = [
    {

      "icon":"lib/assets/ic_public_home_normal.png",
      "active_icon":"lib/assets/ic_public_home_active.png",
      "label":"首页",
    },
    {
      "icon":"lib/assets/ic_public_pro_normal.png",
      "active_icon":"lib/assets/ic_public_pro_active.png",
      "label":"分类",
    },
    {
      "icon":"lib/assets/ic_public_cart_normal.png",
      "active_icon":"lib/assets/ic_public_cart_active.png",
      "label":"购物车",
    },
    {
      "icon":"lib/assets/ic_public_my_normal.png",
      "active_icon":"lib/assets/ic_public_my_active.png",
      "label":"我的",
    },
  ];

  List<BottomNavigationBarItem> _getItems(){
    return List.generate(_tabList.length, (index){
      var item = _tabList[index];
      return BottomNavigationBarItem(
        icon: Image.asset(item["icon"]!,width: 24,height: 24,),
        activeIcon: Image.asset(item["active_icon"]!,width: 24,height: 24,),
        label: item["label"],
      );
    });
  }

  List<Widget> _getViews(){
    return [
      HomeView(),
      CategoryView(),
      CartView(),
      MineView(),
    ];
  } 

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化用户
    _initUser();
  }

  final UserController _userController = Get.put(UserController());
  _initUser() async {
    await tokenManager.init(); // 初始化token
    if (tokenManager.getToken().isNotEmpty) {
      // 如果token有值就获取用户信息
      _userController.updateUserInfo(await getUserInfoAPI());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( // 保持页面状态
          index: _currentIndex,
          children: _getViews(), // 页面列表
      ),
      

      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true, // 显示未选中标签
        selectedItemColor: Colors.black, // 选中颜色
        unselectedItemColor: Colors.black54, // 未选中颜色
        onTap: (index) => {  // 点击事件
          _currentIndex = index,
          setState(() {
        })
        },
        items: _getItems(), // 底部导航栏项
        currentIndex: _currentIndex, // 当前选中索引
        
      ),
    );
  }


}

