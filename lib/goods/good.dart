import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_of_goods/styles/main_colors.dart';
import 'package:rental_of_goods/styles/text_style/style_contacts_page.dart';

class GoodComponent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StateGoodComponent();
  }

}

class _StateGoodComponent extends State<GoodComponent>{
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Container(


      child: Column(
        children: [
          Container(
            height: screenHeight*0.25,
            width:screenWidth*0.41,
            child: Stack(
              children: [
                Container(
                  height: screenHeight*0.25,
                  width:screenWidth*0.4,

                  child:Image.asset("assets/images/drel.png",fit: BoxFit.contain,),
                ),
                Positioned(
                  bottom: 4,
                  left: 4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/eye.svg",height:20,color: color_text_grey,),
                          SizedBox(width: screenWidth*0.05,),
                          Text("13")
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/heart.svg",height:20,color: color_text_grey,),
                          SizedBox(width: screenWidth*0.05,),
                          Text("123")
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              height: screenHeight*0.1,
              width:screenWidth*0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Дрель электрическая",style: style_main_text,textAlign: TextAlign.left,),
                  Text("BOSH 10 RE",style: style_main_600_text,textAlign: TextAlign.left,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Цена:",style: style_main_text,textAlign: TextAlign.left,),
                      Text("1090р в сут.",style: style_main_600_text,textAlign: TextAlign.left,)
                    ],
                  )
                ],
              ),

            ),
          )
        ],
      ),
    );
  }

}