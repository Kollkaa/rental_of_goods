import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_of_goods/styles/text_style/style_faq_page.dart';

import 'list_faq.dart';

class FAQ1Page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StatateFAQPage();
  }

}

class _StatateFAQPage  extends State<FAQ1Page>{
  String titleSettings="FAQ";

  Map<String,String> list={};
  @override
  void initState() {
    list["Как вообще всем пользоваться?"]=" Осуществление клиентской поддержки Получения Пользователем информации о маркетинговых событиях Проведения аудита и прочих внутрених исследований с целью повышения качества предоставляемых услуг ";
    list["Почему у меня не получаеться создать аккаунт?"]=" Осуществление клиентской поддержки Получения Пользователем информации о маркетинговых событиях Проведения аудита и прочих внутрених исследований с целью повышения качества предоставляемых услуг ";
    list["Для каких смартфонов подходит данное приложение?"]=" Осуществление клиентской поддержки Получения Пользователем информации о маркетинговых событиях Проведения аудита и прочих внутрених исследований с целью повышения качества предоставляемых услуг ";
    list["Что такое доставка до адресата"]=" Осуществление клиентской поддержки Получения Пользователем информации о маркетинговых событиях Проведения аудита и прочих внутрених исследований с целью повышения качества предоставляемых услуг ";
    list["Могу ли я отправить сообщение другому юзеру?"]=" Осуществление клиентской поддержки Получения Пользователем информации о маркетинговых событиях Проведения аудита и прочих внутрених исследований с целью повышения качества предоставляемых услуг ";
    list["Как посмотреть сообщение?"]=" Осуществление клиентской поддержки Получения Пользователем информации о маркетинговых событиях Проведения аудита и прочих внутрених исследований с целью повышения качества предоставляемых услуг ";

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