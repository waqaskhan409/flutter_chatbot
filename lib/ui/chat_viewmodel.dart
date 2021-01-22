import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bot_chat/model/constants.dart';
import 'package:flutter_bot_chat/model/message.dart';
import 'package:flutter_bot_chat/repository/chatbot_repository.dart';

class ChatViewmodel extends ChangeNotifier{
  ChatbotReposity reposity = ChatbotReposity();
  List<Message> chat = List();

  void sendMessageTOChatbot(String text) {
    print("message sending.");
    print(text);

      debugPrint("message sent.");
      getMessage(text).then((value){
        print("message waiting.");
        print(value.data);
        chat.add(Message(message: value.data, isByMe: false));

        notifyListeners();
      });
  }

  Future<Response> getMessage(String message){
    Dio dio = new Dio();
    //Instance level
    return dio.post(Constants.REST_API, data:{"message": message},
        options: Options(contentType:Headers.formUrlEncodedContentType ));
  }

}