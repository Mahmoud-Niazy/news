import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static Init(){
    dio= Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true ,
      ),
    );
  }
  static Future GetData({
    required String url,
    required Map<String,dynamic> query ,
})async{
   return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
