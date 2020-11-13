import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_of_goods/styles/main_colors.dart';
import 'package:rental_of_goods/styles/text_style/style_contacts_page.dart';
import 'package:rental_of_goods/styles/text_style/style_profile.dart';
import 'package:rental_of_goods/styles/text_style/style_settings_page.dart';

import 'main_chat.dart';
class DialogPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StateDialogPage();
  }

}

class _StateDialogPage  extends State<DialogPage>{
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: color_text_white,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios,color: color_text_black,),
          onTap: (){
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Диалоги",style: style_title1,),
            Opacity(
              opacity: 0,
              child:GestureDetector(
                child: Icon(Icons.arrow_back_ios,color: color_text_black,),
                onTap: (){
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: color_text_white,
        padding: EdgeInsets.all(16),
        child:SingleChildScrollView(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              dialogItem(screenHeight:screenHeight,screenWidth:screenWidth),
              dialogItem(screenHeight:screenHeight,screenWidth:screenWidth),
              dialogItem(screenHeight:screenHeight,screenWidth:screenWidth),
              dialogItem(screenHeight:screenHeight,screenWidth:screenWidth),
              dialogItem(screenHeight:screenHeight,screenWidth:screenWidth),
              dialogItem(screenHeight:screenHeight,screenWidth:screenWidth),


            ],
          ),
        )
      ),
    );
  }
  dialogItem({screenHeight,screenWidth}){
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 0.1,
                      color: Colors.black
                  )
              )
          ),
          child: Column(
            children: [
              SizedBox(height: screenHeight*0.01,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.2,color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        height: screenHeight*0.05,
                        width: screenHeight*0.05,
                        padding: EdgeInsets.all(1),
                        child: Image.asset("assets/images/drel.png",width: screenHeight*0.02,height: screenHeight*0.02,fit: BoxFit.contain,),
                      ),
                      SizedBox(width: screenWidth*0.02,),
                      Text("Дрель ",style: style_main_600_text,)
                    ],
                  ),
                  Text("890 р/ч",style: style_main_600_text,)
                ],
              ),
              SizedBox(height: screenHeight*0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.2,color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        height: screenHeight*0.05,
                        width: screenHeight*0.05,
                        padding: EdgeInsets.all(1),
                        child: Image.asset("assets/images/mKvu8.jpg",width: screenHeight*0.02,height: screenHeight*0.02,fit: BoxFit.contain,),
                      ),
                      SizedBox(width: screenWidth*0.02,),
                      Text("Сергей Петров ",style: style_main_text,)
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            "12",style: style_main_600_text,
                          ),
                          SizedBox(
                            width: screenWidth*0.01,
                          ),
                          Text(
                            "с-ий",style: style_main_text,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth*0.01,
                      ),
                      Row(
                        children: [
                          Text(
                            "1",style: TextStyle(color: color_button_next),
                          ),
                          SizedBox(
                            width: screenWidth*0.01,
                          ),
                          Text(
                            "новое",style: style_main_text,
                          ),
                        ],
                      )
                    ],
                  ),

                ],
              ),
              SizedBox(height: screenHeight*0.02,),

            ],
          )
      ),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainChat()));
      },
    );
  }
}