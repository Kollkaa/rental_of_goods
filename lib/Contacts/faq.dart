import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_of_goods/styles/text_style/style_faq_page.dart';

import 'list_faq.dart';

class FAQPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StatateFAQPage();
  }

}

class _StatateFAQPage  extends State<FAQPage>{
  String titleSettings="FAQ";

  Map<String,String> list={};
  @override
  void initState() {
    list["Как начать работу в приложение?"]=" Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat";
    list["Меню приложения?"]=" Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat";
    list["Аккаунт/профиль?"]=" Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat";
    list["Услуги приложения"]=" Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat";
    list["Настройки?"]=" Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat";
    list["Уведомления?"]=" Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat";
    list["Не нашёл ответа на свой вопрос?"]=" Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat";

  }
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(

        body: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(height: screenHeight*0.02,),
                    Text("FAQ",style: style_title,),
                    SizedBox(height: screenHeight*0.04,),
                    ...list.entries.map((e) {
                      return ListFAQ(e.key, e.value);
                    }).toList()],
                ),
              )
            ]
        )
    );
  }
}