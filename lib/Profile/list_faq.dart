import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_of_goods/styles/main_colors.dart';
import 'package:rental_of_goods/styles/text_style/style_faq_page.dart';

class ListFAQ extends StatefulWidget{
  String text;
  String listFAQ;
  ListFAQ(this.text,this.listFAQ);

  @override
  _StateListFAQ createState()=>_StateListFAQ();
}
class _StateListFAQ extends State<ListFAQ>
{
  bool open=false;
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            child:Container(

              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border(bottom:BorderSide(width:1,color: Colors.black))
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth*0.78,
                    child:Text(widget.text,style: TextStyle(fontWeight: open?FontWeight.bold:FontWeight.normal,fontSize: 16),),
                  ),
                  Icon(open?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,size: 20,)
                ],
              ),
            ),
            onTap: (){
              print("tap"+widget.text);
              setState(() {
                open=!open;
              });
              print(open);
            },
          ),
          Visibility(
              visible: open,
              child:Container(
                  decoration: BoxDecoration(
                      border: Border(bottom:BorderSide(width:1,color: Colors.black))
                  ),
                  margin: EdgeInsets.only(top: 10,left: 15,bottom: 10,right: 15),
                  child: Text(
                    widget.listFAQ,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    style: style_text,
                    maxLines: 10,)
              )
          )
        ],
      ),
    );
  }


}