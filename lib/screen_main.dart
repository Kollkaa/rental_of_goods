import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_of_goods/Profile/feedback.dart';
import 'package:rental_of_goods/Profile/my_goods.dart';
import 'package:rental_of_goods/Profile/profile.dart';
import 'package:rental_of_goods/Profile/settings.dart';
import 'package:rental_of_goods/styles/main_colors.dart';
import 'package:rental_of_goods/styles/text_style/style_profile.dart';
import 'package:rental_of_goods/styles/text_style/style_settings_page.dart';
import 'package:rental_of_goods/Profile/dialog_page.dart';
class ScreenMainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StateScreenMainPage();
  }

}

class _StateScreenMainPage extends State<ScreenMainPage>{
  int _selectedIndex ;
  PageController _pageController;
  bool but1=true;
  bool but2=false;
  bool but3=false;
  @override
  void initState() {
    _selectedIndex= 0;
    _pageController=PageController();
  }
  @override

  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    List<Widget> _widgetOptions = <Widget>[
      Container(

      ),
      Container(),
      Container(),
      DialogPage(),
      Scaffold(
        appBar: AppBar(
          backgroundColor: color_text_white,
          actions: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.settings,color: color_button_next,),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SettingsPage()));
              },
            ),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: 0,
                child:GestureDetector(
                  child: Icon(Icons.arrow_back_ios,color: color_text_black,),
                  onTap: (){
                  },
                ),
              ),
              Text("Мой профиль",style: style_title1,),

            ],
          ),
        ),
        body:   Container(
          height: screenHeight,
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Container(
                            height: screenHeight*0.05,
                            width: screenWidth*0.2,
                            decoration: BoxDecoration(
                                color: but1?color_text_black:color_text_super_light_grey,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(
                              child: Text("О себе",style:but1?style_button:style_button2,),
                            )
                        ),
                        onTap: (){
                          _pageController.jumpToPage(0);
                          if(_pageController.page==0.0){
                            setState(() {
                              but1=true;
                              but2=false;
                              but3=false;
                            });
                          }
                        },
                      ),
                      GestureDetector(
                        child: Container(
                            height: screenHeight*0.05,
                            width: screenWidth*0.27,
                            decoration: BoxDecoration(
                                color: but2?color_text_black:color_text_super_light_grey,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(
                              child: Text("Мои товары",style: but2?style_button:style_button2,),
                            )
                        ),
                        onTap: (){
                          _pageController.jumpToPage(1);
                          if(_pageController.page==1.0){
                            setState(() {
                              but1=false;
                              but2=true;
                              but3=false;
                            });
                          }
                          print(_pageController.page);

                        },
                      ),
                      GestureDetector(
                        child: Container(
                            height: screenHeight*0.05,
                            width: screenWidth*0.2,
                            decoration: BoxDecoration(
                                color: but3?color_text_black:color_text_super_light_grey,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(
                              child: Text("Отзывы",style: but3?style_button:style_button2,),
                            )
                        ),
                        onTap: (){
                          _pageController.jumpToPage(2);
                          if(_pageController.page==2.0){
                            setState(() {
                              but1=false;
                              but2=false;
                              but3=true;
                            });
                          }
                          print(_pageController.page);

                        },
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 25),
                    height: screenHeight*0.670,
                    child: PageView(
                      physics:new NeverScrollableScrollPhysics()      ,
                      controller: _pageController,
                      children: [
                        ProfilePage(),
                        MyGoodsPage(),
                        FeedbackPage()
                      ],
                    )
                )
              ],
            ),
          )
        ),
      )

    ];
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(

          backgroundColor: color_text_white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: color_border,
          unselectedItemColor: Color.fromRGBO(112,117,120, 1),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon:SvgPicture.asset("assets/icons/menu.svg",color: color_button_next,width: 20,height: 20,),
                title: Text("")
            ),
            BottomNavigationBarItem(
                icon:SvgPicture.asset("assets/icons/heart.svg",color: color_button_next,width:30,height: 30,),
                title: Text("")
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.add_circle_outline,color: color_button_next,size: 35,),
                title: Text("")
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.chat,color: color_button_next,size: 35,),
                title: Text("")
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.supervised_user_circle,color: color_button_next,size: 35),
                title: Text("")
            ),


          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}