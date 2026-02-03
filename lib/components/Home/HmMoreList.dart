import 'package:flutter/material.dart';
import 'package:me_shop/viewmodels/home.dart';

class HmMoreList extends StatefulWidget {
  final List<GoodDetailItem> recommendList;
  HmMoreList({Key? key, required this.recommendList}) : super(key: key);

  @override
  State<HmMoreList> createState() => _HmMoreListState();

}

class _HmMoreListState extends State<HmMoreList> {

    Widget _getChildren(int index) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio( // AspectRatio 组件可以强制子组件按照一定的宽高比进行布局
              aspectRatio: 1, // 1表示宽高比为1:1，即正方形
              child: Image.network(
                widget.recommendList[index].picture,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "lib/assets/home_cmd_inner.png",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10), // 左右各10的内边距
            child: Text(
              widget.recommendList[index].name,
              maxLines: 2, // 最多显示两行
              overflow: TextOverflow.ellipsis, // 超出部分显示省略号
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // 主轴两端对齐
              children: [
                Text.rich(
                  TextSpan(
                    text: "¥${widget.recommendList[index].price}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Text(
                  "${widget.recommendList[index].payCount}人付款",
                  style: TextStyle(color: Colors.grey,fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
        // 必须是Sliver家族的组件
    return SliverGrid.builder(
      itemCount: widget.recommendList.length,
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 网格是两列
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: _getChildren(index),
        );
      },
    );
  }
}