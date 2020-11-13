import 'package:flutter/material.dart';
import 'package:rental_of_goods/screen_main.dart';
import 'Authorization/login_page.dart';
import 'Contacts/contacts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Contacts/faq.dart';
import 'Profile/faq.dart';
import 'Profile/profile.dart';
import 'Profile/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental of Goods',
      theme: ThemeData(
      ),
      home: ScreenMainPage(),
    );
  }
}



