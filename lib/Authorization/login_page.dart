import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_of_goods/Authorization/offert_page.dart';
import 'package:rental_of_goods/Authorization/personal_processing_liseance.dart';
import 'package:rental_of_goods/styles/main_colors.dart';
import 'package:rental_of_goods/styles/text_style/style_login_page.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return  _StateLoginPage();
  }

}
class _StateLoginPage extends State<LoginPage>{
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerCode = TextEditingController();

  String prefixPhone="";
  String phoneNumber="";
  bool sendCode=true;
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return new MaterialApp(
      supportedLocales: [
        Locale('en'),
        Locale('it'),
        Locale('fr'),
        Locale('es'),
        Locale('de'),
        Locale('pt'),
        Locale('ko'),
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
      ],
      home: new Scaffold(

        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: screenHeight*0.04,),
                  _buildLogo(screenHeight,screenWidth),
                  SizedBox(height: screenHeight*0.03,),
                  sendCode?_buildTitle():_buildTitleAfterSendCode(),
                  SizedBox(height: screenHeight*0.03,),
                  sendCode?_buildTitleH2():_buildPhoneText(),
                  SizedBox(height: screenHeight*0.02,),
                  sendCode?_buildPhoneInput(screenHeight,screenWidth):_buildCodeInput(screenHeight,screenWidth),
                  SizedBox(height: screenHeight*0.03,),
                  sendCode?_buildButtonNextCode(context,screenHeight,screenWidth):_buildButtonNext(screenHeight,screenWidth),
                  SizedBox(height: screenHeight*0.08,),
                  _buildOfferta(context)
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
  _buildLogo(screenHeight,screenWidth){
    return new Container(
        width: screenWidth*0.3,
        height: screenWidth*0.3,
        decoration: new BoxDecoration(
          border: Border.all(color: color_border_logo,width: 3),
        shape: BoxShape.circle,
        ),
      child: Center(
        child: Text("Logo"),
      ),
    );
  }
  _buildTitle(){
    return Center(
      child: Text(
        "Войти",
        style: styleTitleLogin,
      ),
    );
  }
  _buildTitleAfterSendCode(){
    return Center(
      child: Text(
        "Подтверждение входа",
        style: styleTitleLogin,
      ),
    );
  }
  _buildTitleH2(){
    return Center(
      child: Text(
        "Укажите номер телефона",
        style: styleTitleH2Login,
      ),
    );
  }
  showDialogPhoneNumberError(context){
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;

    showDialog(context:context ,
     builder:(context)=> Container(
       margin: EdgeInsets.only(left:  screenWidth*0.1,right: screenWidth*0.1,bottom: screenHeight*0.3,top: screenHeight*0.3),

       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
              color: color_text_white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
              child: Text(
                "Ошибка",style: styleTitleLogin,
              ),
            ),
            FlatButton(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Вы ввели некоректный номер телефона, введите корректный",style: styleTitleH2Login,textAlign: TextAlign.center,
                ),
              )
            ),
            FlatButton(
              onPressed: (){Navigator.of(context).pop();},
              child: Container(
                width: screenWidth*0.6,
                height: screenHeight*0.08,
                decoration: BoxDecoration(
                  color: color_button_next,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                      "Ок",style: styleButtonNextLogin,
                  ),
                )
              )
            ),
          ],
        ),
      ),
    );
  }
  showDialogCodeError(context){
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;

    showDialog(context:context ,
      builder:(context)=> Container(
        margin: EdgeInsets.only(left:  screenWidth*0.1,right: screenWidth*0.1,bottom: screenHeight*0.2,top: screenHeight*0.3),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color_text_white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
              child: Text(
                "Ошибка",style: styleTitleLogin,
              ),
            ),
            FlatButton(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Вы ввели некоректный код из SMS. Введите корректный или отправьте его ещё раз на свой телефон",style: styleTitleH2Login,textAlign: TextAlign.center,
                  ),
                )
            ),
            FlatButton(
                onPressed: (){Navigator.of(context).pop();},
                child: Container(
                    width: screenWidth*0.6,
                    height: screenHeight*0.08,
                    decoration: BoxDecoration(
                      color: color_button_next,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        "Ок",style: styleButtonNextLogin,
                      ),
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
  _buildButtonNextCode(context,screenHeight,screenWidth){
    return GestureDetector(
      onTap: (){
        try{
          print(prefixPhone);
          print(_controller.text);
        }catch(e){}

        if(prefixPhone!="" && _controller!=null&& _controller.text.length==9){

        setState(() {
          sendCode=!sendCode;
        });
      }else{
         showDialogPhoneNumberError(context);
        }
      },
      child: Container(
        width: screenWidth*0.9,
        height: screenHeight*0.07,
        decoration: BoxDecoration(
          color: color_button_next,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            "Далее",
             style: styleButtonNextLogin
          ),
        ),
      ),
    );
  }
  _buildButtonNext(screenHeight,screenWidth){
    return GestureDetector(
      onTap: (){
        try{
          print(_controllerCode.text);
        }catch(e){}

        if( _controllerCode!=null&& _controllerCode.text.length==4&&_controllerCode.text.toLowerCase()=="1234"){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PersonalLiseancePage()));
        }else{
          showDialogCodeError(context);
        }
      },
      child: Container(
        width: screenWidth*0.9,
        height: screenHeight*0.07,
        decoration: BoxDecoration(
          color: color_button_next,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
              "Далее",
              style: styleButtonNextLogin
          ),
        ),
      ),
    );
  }
  _buildPhoneInput(screenHeight,screenWidth ){
   return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(width: 2, color: color_border)
        ),
        height: screenHeight*0.08,
        padding: EdgeInsets.all(screenHeight*0.009),
        child: Row(
          children: [
            CountryCodePicker(
              onChanged: (value){
                print(value);
                prefixPhone=value.toString();
                print(prefixPhone);
              },
              initialSelection: 'US',
              showFlagDialog: true,
            ),
            Container(

              width: screenWidth*0.6,
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your phone'
                ),
              ),
            )

          ],
        )
    );
  }

  _buildPhoneText() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.phone),
          Text(
            prefixPhone+_controller.text
          ),

        ],
      ),
    );
  }
  _buildCodeInput(screenHeight,screenWidth) {
    return Container(
      child: Column(
        children: [
          Container(
            width: screenWidth*0.8,
            child: Text("На этот номер телефона был отправлен SMS с кодом, введите его ",maxLines: 2,textAlign: TextAlign.center,style: styleTitleH2Login,),
          ),
          SizedBox(
            height: screenHeight*0.05,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    border: Border.all(width: 2, color: color_border)
                ),
                height: screenHeight*0.08,
                width: screenWidth*0.2,
                padding: EdgeInsets.all(screenHeight*0.009),
                child:TextField(
                  controller: _controllerCode,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'X X X X'
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth*0.02,
              ),
              Container(
                width: screenWidth*0.6,
                child: Text("Получить код повторно можно через 60 сек",style: styleTextSendedCodeLogin,),
              )
            ],
          )
        ],
      ),
    );
  }

  _buildOfferta(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OffertaPage()));
      },
      child: Container(
        width:screenWidth*0.9 ,
        child: Text(
          'Нажимая на кнопку "Далее", вы подверждаете, что ознакомлены и согласны с условиями Публичной оферты',textAlign: TextAlign.center,style: styleTextSendedCodeLogin,
        ),
      ),
    );
  }
}
