import 'package:news_flutter/shared/imports/exports.dart';

class DioHelper
{
  static Dio? dio ;

  static void init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/' ,
        receiveDataWhenStatusError: true ,
      )
    );
  }
  static Future<Response> getData({
  required String url ,
  Map<String, dynamic>? queryParameters ,

}) async
  {
    return await dio!.get(
      url ,
      queryParameters: queryParameters
    );
  }

}