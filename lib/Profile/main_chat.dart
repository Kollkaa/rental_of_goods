import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'chat_appbar.dart';

enum MessageType {
  SENDER,
  RECIEVER
}

class MainChat extends StatefulWidget {
  final String name;
  final String url;
  final String dateCreated;
  final int chatId;
  final String uuid;
  final String phone;
  const MainChat({Key key, this.name, this.url, this.dateCreated, this.chatId, this.uuid, this.phone}) : super(key: key);
  @override
  _MainChatState createState() => _MainChatState();
}

class _MainChatState extends State<MainChat> {
  TextEditingController _textEditingController;

  String refreshed_token = "";

  Future <String> _refreshToken() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var response = await http.post("https://api.mapus.com.ua/v2/system/customers/authorization/refresh",
        headers:
        {"authorization" : "Bearer ${_prefs.getString("token_customer")}"},
        body: {"refresh_token" : "${_prefs.getString("token_customer_refresh")}"});
    print(response.statusCode);
    print(response.body);
    setState(() {
      refreshed_token = json.decode(response.body)['data']['bearer_token'];
    });
  }



  Image image;
  File img;



  void connectToChatSocket() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String,dynamic> map = {
      "action" : "connect",
      "token" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLm1hcHVzLmNvbS51YSIsImF1ZCI6Imh0dHBzOlwvXC9hcGkubWFwdXMuY29tLnVhIiwiaWF0IjoxNjA0NTE2NDU5LCJleHAiOjE2MDQ1MTcwNTksImlkIjoiMjYwIiwicmVtZW1iZXIiOiIwIn0.RJ6FIx_Os0Zachxx8_CABWz7C5MQNpZoHgA2YIeLNvI",
      "mode" : "chat",
      "type" : "customer"
    };

    Map<String, dynamic> chatHistory = {
      "action" : "fetch",
      "uuid" : widget.uuid,
      "mode" : "chat",
      "type" : "customer"
    };
    print(map);

    setState(() {

    });
  }

  void sendMessage(){
    String message = _textEditingController.text;
    List encodedText = utf8.encode(message);
    String base64message = base64.encode(encodedText);
    Map<String, dynamic> messageObj = {
      "action" : "message",
      "uuid" : widget.uuid,
      "mode" : "chat",
      "type" : "customer",
      "file_id" : "",
      "message" : "$base64message"
    };
  }

  void _getChatHistory() async{

  }

  @override
  void initState() {
    _textEditingController = new TextEditingController();
    connectToChatSocket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ChatDetailPageAppBar(url: "widget.url", name: "widget.name",),
      body: Stack(
        children: <Widget>[
          StreamBuilder(
            builder: (context, snapshot){
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text(snapshot.hasData ? "${snapshot.data}" : "123"),
             );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 16,bottom: 10),
              height: 50,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 16,),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _textEditingController,
                      onEditingComplete: (){
                        _textEditingController.text.isEmpty ? sendMessage() : null;
                      },
                      decoration: InputDecoration(
                          hintText: "Сообщение..",
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.only(right: 17, bottom: 15),
              child: InkWell(
                child: Image.asset(
                  "assets/Photo Add.png"
                ),
                onTap: (){
                  sendMessage();
                },
              )
            ),
          )
        ],
      ),
    );
  }

}

//I/flutter (15246): 123132 eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLm1hcHVzLmNvbS51YSIsImF1ZCI6Imh0dHBzOlwvXC9hcGkubWFwdXMuY29tLnVhIiwiaWF0IjoxNjA0NTE2NDU5LCJleHAiOjE2MDQ1MTcwNTksImlkIjoiMjYwIiwicmVtZW1iZXIiOiIwIn0.RJ6FIx_Os0Zachxx8_CABWz7C5MQNpZoHgA2YIeLNvI
//I/flutter (15246): 123333132 eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLm1hcHVzLmNvbS51YSIsImF1ZCI6Imh0dHBzOlwvXC9hcGkubWFwdXMuY29tLnVhIiwiaWF0IjoxNjA0NTE2NDU5LCJleHAiOjE2MDcxMDg0NTl9.08YDxTgrGnIcKkxB7ELKwqN_mrUkIZ7Ie3C2Zj53F6I
//