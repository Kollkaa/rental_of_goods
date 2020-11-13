import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_of_goods/Contacts/contacts.dart';
import 'package:rental_of_goods/styles/main_colors.dart';
import 'package:rental_of_goods/styles/text_style/style_login_page.dart';

class PersonalLiseancePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StatePersonalLiseancePage();
  }

}

class _StatePersonalLiseancePage extends State<PersonalLiseancePage>{
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(

      body: Container(
        color: color_text_white,
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    IconButton(icon: Icon(Icons.arrow_back_ios,color: color_text_black,),onPressed: (){Navigator.of(context).pop();},),
                    Text(
                      "Обработка персональных данных", style: styleAppbarOffetaTitle,
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Text("Обработка персональных данных — совокупность действий (операций), совершаемых с использованием средств автоматизации или без использования таких средств с персональными данными, включая сбор, запись, систематизацию, накопление, хранение, уточнение (обновление, изменение), извлечение, использование, передачу (распространение, предоставление, доступ), обезличивание, блокирование, удаление, уничтожение персональных данных.",
                      style: styleOffertaText,
                    )            ),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Text("Обработка персональных данных — совокупность действий (операций), совершаемых с использованием средств автоматизации или без использования таких средств с персональными данными, включая сбор, запись, систематизацию, накопление, хранение, уточнение (обновление, изменение), извлечение, использование, передачу (распространение, предоставление, доступ), обезличивание, блокирование, удаление, уничтожение персональных данных.",
                      style: styleOffertaText,
                    )            ),
                GestureDetector(
                  child: Container(
                    height: screenHeight*0.08,
                    width: screenWidth*0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: color_button_next
                    ),
                    child: Center(
                      child: Text("Согласен",style: styleButtonNextLogin,),
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ContactsPage()));
                  },
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  child: Container(
                    height: screenHeight*0.08,
                    width: screenWidth*0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: color_text_super_light_grey
                    ),
                    child: Center(
                      child: Text("Не согласен",style: styleButtonNotLogin,),
                    ),
                  ),
                ),
                SizedBox(height: 20,),


              ],
            ),
          ],
        )
      ),
    );
  }

}