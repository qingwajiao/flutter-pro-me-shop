import 'package:flutter/material.dart';
import 'package:me_shop/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget{
  final SpecialRecommendResult specialRecommendResult;
  HmSuggestion({Key? key, required this.specialRecommendResult}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _HmSuggestionState();
  
}

// ignore: camel_case_types
class _HmSuggestionState extends State<HmSuggestion> {

    // 取前3条数据
  List<GoodsItem> _getDisplayItems() {
    if (widget.specialRecommendResult.subTypes.isEmpty) return [];
    return widget.specialRecommendResult.subTypes.first.goodsItems.items
        .take(3)
        .toList();
  }

  Widget _buildHeader(){
    return Row(
      children: [
        Text(
          "特惠推荐",
          style: TextStyle(
            color: const Color.fromARGB(255, 86, 24, 20),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "精选省攻略",
          style: TextStyle(
            fontSize: 12,
            color: const Color.fromARGB(255, 124, 63, 58),
          ),
        ),
      ],
    );
  }

    // 左侧结构
  Widget _buildLeft() {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("lib/assets/home_cmd_inner.png"),
          fit: BoxFit.cover, //图片填充方式
        ),
      ),
    );
  }

    List<Widget> _getChildrenList() {
    List<GoodsItem> list = _getDisplayItems(); // 取到前3条数据
    return List.generate(list.length, (int index) {
      return Column(
        children: [
          // ClipRRect 可以包裹子元素 裁剪图片设置圆角
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              errorBuilder: (context, error, stackTrace) {
                //  Image.network如果刚开始还没获取到图片，则用errorBuilder返回一个新的部件替换原有图片
                return Image.asset(
                  "lib/assets/home_cmd_inner.png",
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                );
              },
              list[index].picture,
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 240, 96, 12),
            ),
            child: Text(
              "¥${list[index].price}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center, // 纵向居中
      height: 300,
      padding: EdgeInsets.only(top: 20), // 上下间距10
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            image: AssetImage("lib/assets/home_cmd_sm.png"),
            fit: BoxFit.cover, // 图片填充方式
        ),
      ),
      child: Column(
        children: [
          _buildHeader(),
          SizedBox(width: 10),
          Row(
            children: [
              _buildLeft(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                  children: _getChildrenList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
}
}