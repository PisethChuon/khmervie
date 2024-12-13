// import 'package:Khmervie/Navagation/home.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const GetMaterialApp(home: HomeBarNavigator());
//   }
// }


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Overlay Widgets")),
        body: SafeArea(
          child: Center(
            child: Stack(
              children: <Widget>[
                MessageBubble(
                    message: _message, sender: "Fonkam Loic", isMe: true),
                MessageBubble(
                    message: "What is Lorem Ipsum", sender: "You", isMe: false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final String _message =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book... ";
}

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.message, required this.sender, required this.isMe});
  final String message, sender;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 7.0),
                child: Text(
                  message,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: isMe ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
