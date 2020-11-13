import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_of_goods/styles/main_colors.dart';
import 'package:rental_of_goods/styles/text_style/style_login_page.dart';

class OffertaPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StateOffertaPage();
  }

}

class _StateOffertaPage extends State<OffertaPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: color_text_white,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                IconButton(icon: Icon(Icons.arrow_back_ios,color: color_text_black,),onPressed: (){Navigator.of(context).pop();},),
                Text(
                  "Пользовательськое соглашение", style: styleAppbarOffetaTitle,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Офе́рта (лат. offero — предлагаю) — предложение о заключении сделки,"
                  " в котором изложены существенные условия договора, адресованное определённому лицу, ограниченному "
                  "или неограниченному кругу лиц. Если получатель (адресат) принимает оферту (выражает согласие, акцептует её",
              style: styleOffertaText,
              )            ),
            Container(
                padding: EdgeInsets.all(20),
                child: Text("Офе́рта (лат. offero — предлагаю) — предложение о заключении сделки,"
                    " в котором изложены существенные условия договора, адресованное определённому лицу, ограниченному "
                    "или неограниченному кругу лиц. Если получатель (адресат) принимает оферту (выражает согласие, акцептует её",
                  style: styleOffertaText,
                )            ),
            Container(
                padding: EdgeInsets.all(20),
                child: Text("Офе́рта (лат. offero — предлагаю) — предложение о заключении сделки,"
                    " в котором изложены существенные условия договора, адресованное определённому лицу, ограниченному "
                    "или неограниченному кругу лиц. Если получатель (адресат) принимает оферту (выражает согласие, акцептует её",
                  style: styleOffertaText,
                )            ),

          ],
        ),
      ),
    );
  }

}