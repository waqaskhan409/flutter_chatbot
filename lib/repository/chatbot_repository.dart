import 'package:dio/dio.dart';
import 'package:flutter_bot_chat/model/constants.dart';

class ChatbotReposity{

  Future<Response> getMessage(String message){
    Dio dio = new Dio();
    //Instance level
    return dio.post(Constants.REST_API, data:{"message": message},
        options: Options(contentType:Headers.formUrlEncodedContentType ));
  }



}