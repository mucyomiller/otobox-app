import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:otobox/src/models/post.dart';
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

Future<List<Post>> fetchPost() async {
  List<Post> datas = [
    Post(
      brandName: 'BMW',
      modelName: 'BMW Series 2',
      year: '2008',
      type: 'RENT',
      price: '100,000Rwf/day',
      asset: 'https://res.cloudinary.com/mucyomiller/image/upload/v1583329134/otobox/cars/BMW2SeriesConvertible_ds7xjj.png',
      logo: 'https://res.cloudinary.com/mucyomiller/image/upload/v1583329176/otobox/logos/bmw_oq6jak.png',
    ),
    Post(
      brandName: 'TOYOTA',
      modelName: 'Prado',
      year: '2009',
      type: 'SALE',
      price: '66,500,000Rwf',
      asset: 'https://res.cloudinary.com/mucyomiller/image/upload/v1583329134/otobox/cars/BMW2SeriesConvertible_ds7xjj.png',
      logo: 'https://res.cloudinary.com/mucyomiller/image/upload/v1583329176/otobox/logos/toyota_kp7qvu.png',
    ),
    Post(
      brandName: 'LEXUS',
      modelName: 'Lexus aristo ',
      year: '2005',
      type: 'SALE',
      price: '66,500,000Rwf',
      asset: 'https://res.cloudinary.com/mucyomiller/image/upload/v1583329134/otobox/cars/BMW2SeriesConvertible_ds7xjj.png',
      logo: 'https://res.cloudinary.com/mucyomiller/image/upload/v1583329176/otobox/logos/lexus_vwjx6y.png',
    ),
    Post(
      brandName: 'MERCEDES BENZ',
      modelName: 'Mercedes Benz CLS ',
      year: '2009',
      type: 'SALE',
      price: '5,000,000Rwf',
      asset: 'https://res.cloudinary.com/mucyomiller/image/upload/v1583329134/otobox/cars/BMW2SeriesConvertible_ds7xjj.png',
      logo: 'https://res.cloudinary.com/mucyomiller/image/upload/v1583329176/otobox/logos/benz_z6yi0v.png',
    ),
  ];

  return datas;
}
