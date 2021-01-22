import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bot_chat/model/constants.dart';
import 'package:flutter_bot_chat/model/message.dart';
import 'package:flutter_bot_chat/ui/chat_viewmodel.dart';
import 'package:provider/provider.dart';

class IndividualChat extends StatefulWidget {
  @override
  _IndividualChatState createState() => _IndividualChatState();
}

class _IndividualChatState extends State<IndividualChat> with TickerProviderStateMixin{
  TextEditingController chatController = TextEditingController();
  bool isEmoji = false;
  double _height = 150;
  ChatViewmodel model;
  var focusNode = FocusNode();
  final _scrollController = ScrollController();


  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );




    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    model = Provider.of<ChatViewmodel>(context, listen: false);
    focusNode.requestFocus();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(19, 153, 159, 1.0),
        title: Text(
          "Psychological Chatbot",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, .0),
            child: Text(
              (DateTime.now().toLocal().toString()/*.year.toString() + " / " +DateTime.now().month.toString() +" / "+DateTime.now().day.toString()*/),
              style: TextStyle(color: Colors.black45),
            ),
          ),
          Expanded(
            child: Consumer<ChatViewmodel>(
            builder: (_, model, child){
              return  Scrollbar(
                  child:  ListView.builder(
                    // reverse: true,
                shrinkWrap: true,
                itemCount: model.chat.length,
                controller:  _scrollController,

                itemBuilder: (_, i){
                  return !(model.chat[i].isByMe) ? Container(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    margin: EdgeInsets.fromLTRB(5.0, 0.0, MediaQuery.of(context).size.width * .15, 20.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 245, 245, 1.0),
                      border: Border.all(
                          color: Color.fromRGBO(245, 245, 245, 1.0)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          // has the effect of softening the shadow
                          spreadRadius: 3.0,
                          // has the effect of extending the shadow
                          offset: Offset(
                            2.0, // horizontal, move right 10
                            2.0, // vertical, move down 10
                          ),
                        ),
                      ],
                    ),
                    child: Text(
                      model.chat[i].message,
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ) :
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * .15, 0.0, 5.0, 20.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(19, 153, 159, 1.0),
                      border: Border.all(
                          color: Color.fromRGBO(19, 153, 159, 1.0)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          // has the effect of softening the shadow
                          spreadRadius: 3.0,
                          // has the effect of extending the shadow
                          offset: Offset(
                            2.0, // horizontal, move right 10
                            2.0, // vertical, move down 10
                          ),
                        ),
                      ],
                    ),
                    child: Text(
                      model.chat[i].message,
                      style: TextStyle(

                          fontSize: 17.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  );
                },
              ));





                ListView.builder(
                shrinkWrap: true,
                itemBuilder: (_, i) {
                  return i % 2 != 0
                      ? Container(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    margin: EdgeInsets.fromLTRB(5.0, 0.0, 35.0, 20.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 245, 245, 1.0),
                      border: Border.all(
                          color: Color.fromRGBO(245, 245, 245, 1.0)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          // has the effect of softening the shadow
                          spreadRadius: 3.0,
                          // has the effect of extending the shadow
                          offset: Offset(
                            2.0, // horizontal, move right 10
                            2.0, // vertical, move down 10
                          ),
                        ),
                      ],
                    ),
                    child: Text(
                      model.chat[i].message,
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ) :
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    margin: EdgeInsets.fromLTRB(35.0, 0.0, 5.0, 20.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(19, 153, 159, 1.0),
                      border: Border.all(
                          color: Color.fromRGBO(19, 153, 159, 1.0)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          // has the effect of softening the shadow
                          spreadRadius: 3.0,
                          // has the effect of extending the shadow
                          offset: Offset(
                            2.0, // horizontal, move right 10
                            2.0, // vertical, move down 10
                          ),
                        ),
                      ],
                    ),
                    child: Text(
                      model.chat[i].message,
                      style: TextStyle(

                          fontSize: 17.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  );
                },
                itemCount: (model.chat.length),
              );
            },
            )
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 245, 245, 1.0),
              border: Border.all(color: Color.fromRGBO(245, 245, 245, 1.0)),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5.0,
                  // has the effect of softening the shadow
                  spreadRadius: 3.0,
                  // has the effect of extending the shadow
                  offset: Offset(
                    2.0, // horizontal, move right 10
                    2.0, // vertical, move down 10
                  ),
                ),
              ],
            ),
            height: _height,
            child: Column(
              children: <Widget>[
                isEmoji? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
//                  child: EmojiPicker(
//                    rows: 3,
//                    columns: 7,
//                    recommendKeywords: ["racing", "horse"],
//                    numRecommended: 10,
//                    onEmojiSelected: (emoji, category) {
//                      chatController.text = chatController.text + emoji.toString().split("Emoji:")[1];
//                    },
//                  ),
                  child: Text("QWEQWE"),
                ): Container(),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(10.0, .0, .0, .0),
                      width: MediaQuery.of(context).size.width -20 ,
                      child: TextFormField(
                        focusNode: focusNode,
                        textInputAction: TextInputAction.search,
                        onFieldSubmitted: (_){
                          if(_ != ""){
                            model.chat.add(Message(message: _, isByMe: true));
                            model.sendMessageTOChatbot(_);
                            chatController.text = "";
                            focusNode.requestFocus();
                            model.notifyListeners();
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                            );
                          }
                        },
                        controller: chatController,
                        decoration: InputDecoration(
                            hintText: "Write your message...",
                            border: InputBorder.none),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: <Widget>[
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                      if(chatController.text != ""){
                        model.chat.add(Message(message: chatController.text, isByMe: true));
                        model.sendMessageTOChatbot(chatController.text);
                        chatController.text = "";
                        model.notifyListeners();
                      }
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                      );
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent),
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                        child: Text("Send Message",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }



}
