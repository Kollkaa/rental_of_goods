import 'package:flutter/cupertino.dart';
import 'package:rental_of_goods/goods/good.dart';

class MyGoodsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StateMyGoodsPage();
  }

}

class _StateMyGoodsPage extends State<MyGoodsPage>{
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Container(
      child: ListView(
        primary: false,
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GoodComponent(),
              GoodComponent(),
            ],
          ),
          SizedBox(height: screenHeight*0.05,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              GoodComponent(),
              GoodComponent(),
            ],
          ),
          SizedBox(height: screenHeight*0.05,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              GoodComponent(),
              GoodComponent(),
            ],
          ),
        ],
      ),
    );
  }
}