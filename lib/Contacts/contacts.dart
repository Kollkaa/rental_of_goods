import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rental_of_goods/styles/main_colors.dart';
import 'package:rental_of_goods/styles/text_style/style_contacts_page.dart';

class ContactsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StateContactsPage();
  }

}

class _StateContactsPage  extends State<ContactsPage>{
  static LatLng _initialPosition;
  GoogleMapController mapController;
  Set<Marker> _markers = {};

  @override
  void initState() {
    _initialPosition = LatLng(55.737769, 37.599226);
    _markers = Set.from([]);
  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId("111"),
        position: LatLng(55.738458, 37.586346),
        infoWindow: InfoWindow(
          title: "Наш Офис",
        ),

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ));
    });
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
          children: [
            Container(
                padding: EdgeInsets.all(20),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset("assets/icons/menu.svg",color: color_button_next,width: 17,height: 17,),
                    ),
                    SizedBox(height: screenHeight*0.02,),
                    Text("Контакты",style: style_title_text,),
                    SizedBox(height: screenHeight*0.02,),
                    Container(
                      padding: EdgeInsets.only(bottom: screenHeight*0.02),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1, color: color_text_grey))
                      ),
                      width: screenWidth*0.8,
                      child: Text("Если у вас есть допольнительные вопросы, свяжитесь с нами",style: style_main_text,textAlign: TextAlign.left,),
                    ),
                    SizedBox(height: screenHeight*0.02,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Режим работы: еж-но с ",style: style_main_text,),
                        Text("(",style: style_contacts_text,),
                        Text("с",style: style_main_text,),
                        Text(" 9:00",style: style_contacts_text,),
                        Text(" до ", style: style_main_text,),
                        Text("20:00)",style: style_contacts_text,),
                      ],
                    ),
                    SizedBox(height: screenHeight*0.02,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color_text_super_light_grey
                              ),
                              child: Icon(Icons.alternate_email,color: color_text_white,),
                            ),
                            SizedBox(width: screenHeight*0.02,),
                            Text("Shering@mail.ru",style: style_contacts_text,)
                          ],
                        ),
                        SizedBox(height: screenHeight*0.01,),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color_text_super_light_grey
                              ),
                              child: Icon(Icons.phone,color: color_text_white,),
                            ),
                            SizedBox(width: screenHeight*0.02,),

                            Text("+7(495)737-54-11",style: style_contacts_text,)
                          ],
                        ),
                        SizedBox(height: screenHeight*0.01,),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color_text_super_light_grey
                              ),
                              child: Icon(Icons.location_on,color: color_text_white,),
                            ),
                            SizedBox(width: screenHeight*0.02,),

                            Text("Адрес: ул. Северная, 77а",style: style_contacts_text,)
                          ],
                        ),
                        SizedBox(height: screenHeight*0.01,),
                        Container(
                          padding: EdgeInsets.only(bottom: screenHeight*0.02),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1, color: color_text_grey))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Мы в соц. сетях",
                              ),
                              SizedBox(width: screenHeight*0.02,),
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:color_social
                                  ),
                                  child: SvgPicture.asset("assets/icons/inst.svg",color: color_text_white,),
                                ),
                              ),
                              SizedBox(width: screenHeight*0.02,),
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:color_social
                                  ),
                                  child: SvgPicture.asset("assets/icons/fb.svg",color: color_text_white,),
                                ),
                              ),
                              SizedBox(width: screenHeight*0.02,),
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:color_social
                                  ),
                                  child: SvgPicture.asset("assets/icons/vk.svg",color: color_text_white,),
                                ),
                              )
                            ],
                          ),

                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight*0.01,),
                    Container(
                      width: screenWidth*0.8,
                      child: Text(
                        "Отзывы, пожелания и замечания вы можете отправить нам на нашу электронную почту:",
                        style: style_main_text,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: screenHeight*0.01,),
                    Text("Arenda@mail.ru",style: style_main_600_text,),


                  ],
                )
            ),
            Container(
              height: screenHeight*0.3,
              width: screenWidth,
              child: GoogleMap(
                markers: _markers,
                initialCameraPosition: CameraPosition(
                  target: _initialPosition,
                  zoom: 13,
                ),
                zoomControlsEnabled: false,
                zoomGesturesEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  setState(() {
                    mapController=controller;

                  });
                },
              ),
            ),
            SizedBox(height: screenHeight*0.06,)
          ],
        ),

    );
  }
}