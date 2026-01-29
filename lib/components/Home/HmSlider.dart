import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:me_shop/viewmodels/home.dart';

class HmSlider extends StatefulWidget{
  final List<BannerItem> bannerList;
  HmSlider({Key? key, required this.bannerList}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _HmSliderState();
  
}

// ignore: camel_case_types
class _HmSliderState extends State<HmSlider> {
  CarouselSliderController _controller = CarouselSliderController();
  int currentIndex = 0;

  Widget _getSlider(){
    return CarouselSlider(
      carouselController: _controller,
      items: List.generate(widget.bannerList.length, (index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        );
      }),
      options: CarouselOptions(
        height: 180.0,
        autoPlay: true,
        // enlargeCenterPage: true, // 中心放大
        viewportFraction: 1.0, // 每次显示一个
        aspectRatio: 16/9, // 宽高比
        autoPlayInterval: Duration(seconds: 3), // 自动播放间隔时间
        autoPlayAnimationDuration: Duration(milliseconds: 800), // 动画持续时间
        autoPlayCurve: Curves.fastOutSlowIn, // 动画曲线
      ),
    );
  }

    Widget _getSearch(){
    return Positioned(
      top: 15,
      left: 20,
      right: 20,
      child: Container(
        height: 25,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 0.4),
          borderRadius: BorderRadius.circular(20), // 圆角
        ),
        child: TextField(
          decoration: InputDecoration( 
            hintText: "搜索商品",
            contentPadding: EdgeInsets.only(left: 20), // 内容内边距
            // floatingLabelAlignment: FloatingLabelAlignment.center,
            hintStyle: TextStyle(color: Colors.white70, fontSize: 14),
            border: InputBorder.none,// 去掉边框
            prefixIcon: Icon(Icons.search),
            
            // contentPadding: EdgeInsets.symmetric(vertical: 10), // 上下内边距10
          ),
        ),
      ),
    );
  }

  Widget _getDots(){
     return Positioned(
      bottom: 10,
      left: 20,
      right: 20,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // 居中
          children: List.generate(widget.bannerList.length, (index) {
            return GestureDetector(
              onTap: (){
                // 点击小点跳转到对应的图片
                _controller.animateToPage(
                  index,
                  duration: Duration(milliseconds: 800), 
                  curve: Curves.fastOutSlowIn);
                setState(() {
                  currentIndex = index;
                }); 
              },
              child: AnimatedContainer( // AnimatedContainer动画容器 代替 Container
                duration: Duration(milliseconds: 800), // 动画持续时间
                height: 6,
                width: currentIndex == index ? 40 : 20,
                margin: EdgeInsets.symmetric(horizontal: 4), // 左右间距4
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3), // 圆角
                  color: currentIndex == index ?Colors.white.withOpacity(0.5):Color.fromRGBO(0, 0, 0, 0.3), // 白色半透明
              ),
            ),
            );
          }),
        ),
      )
     );
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_getSlider(),_getSearch(),_getDots()],);
}
}



