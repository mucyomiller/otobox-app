import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:otobox/src/models/user_model.dart';

class Resource<T> {
  T Function(Response response) parse;
  String url;

  Resource({this.parse, this.url});
}

Future<Dio> getClient() async {
  Dio _dio;
  if (_dio != null) {
    return _dio;
  }
  _dio = new Dio();
  var prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token');
  if (token.isNotEmpty) {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // Add JWT token
      options.headers["Authorization"] = 'Bearer $token';
      if (kDebugMode) print('added token -> $token');
      return options;
    }, onResponse: (Response response) async {
      return response; // continue
    }, onError: (DioError e) async {
      return e; //continue
    }));
  }
  return _dio;
}

Future<T> getTransport<T>(Resource<T> resource) async {
  Dio dio = await getClient();
  final response = await dio.get(resource.url);

  if (response.statusCode == 200) {
    if (kDebugMode) print('transports from api are loaded');
    return resource.parse(response);
  } else {
    throw Exception('Failed to tranport load data!');
  }
}

Future<UserModel> getCurrentUser() async {
  return throw UnimplementedError();
}

Future<String> updateUserProfile(File profileImage, String userId) async {
  return throw UnimplementedError();
}

Future<String> updateUserProfileField(
    {String fieldName, String data, String userId}) async {
  return throw UnimplementedError();
}

Future<bool> updatePassword({String oldsecret, String secret}) async {
  return throw UnimplementedError();
}
