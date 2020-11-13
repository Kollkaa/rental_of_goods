import 'package:flutter/material.dart';

class ChatDetailPageAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String name;
  final String url;
  final String phone;
  const ChatDetailPageAppBar({Key key, this.name, this.url, this.phone}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.only(right: 16),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
//                  channel.sink.close();
                },
                icon: Icon(Icons.arrow_back,color: Colors.black,),
              ),
              SizedBox(width: 2,),
              CircleAvatar(
                backgroundImage: NetworkImage(url),
                maxRadius: 20,
              ),
              SizedBox(width: 12,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(name,style: TextStyle(fontWeight: FontWeight.w600),),
                    SizedBox(height: 6,),
                    Text("Online",style: TextStyle(color: Colors.green,fontSize: 12),),
                  ],
                ),
              ),
              InkWell(
                child: Image.asset("assets/Call.png"),
                onTap: ()async{

                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
