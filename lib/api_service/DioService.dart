
import 'dart:core';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../screens/home/models/ImagesModel.dart';
import '../utils/ConstantUtils.dart';


class DioService{

  static final _dio = Dio(
      BaseOptions(connectTimeout: 60000,baseUrl: ConstantUtils.BASE_URL,contentType: Headers.jsonContentType,
          responseType: ResponseType.json)
  );

  Future<Response<dynamic>> getImages(BuildContext context,int pageNo) async{
    const String apiKey = '46323034-48e49ba8d56942a4e6d843ab4';
    final response = await _dio.get(ConstantUtils.BASE_URL, queryParameters: {
      'key': apiKey,
      'q': 'yellow flowers',
      'image_type': 'photo',
      'pretty': 'true',
      'per_page': '10',
      'page': pageNo, // Dynamic page number
    });

    debugPrint("getImages response :${response.data}");


    return response;


  }

}



