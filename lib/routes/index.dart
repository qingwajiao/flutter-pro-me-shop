import 'package:flutter/material.dart';
import 'package:me_shop/pages/Login/index.dart';
import 'package:me_shop/pages/Main/index.dart';

Widget getRootWiget(){
  return MaterialApp(
    initialRoute: "/",
    // 命名路由
    routes: getRoutes(),
  );
}

Map<String, Widget Function(BuildContext)> getRoutes(){
  return {
    "/":(context) => MainPage(),
    "/login":(context) => LoginPage(),
  };
}