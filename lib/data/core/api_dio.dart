import 'package:dio/dio.dart';

import 'api_constants.dart';

class ApiDio {
  final Dio _dio;

  ApiDio(this._dio);

  dynamic get() async {
    final resp = await Dio().get('${ApiConstants.baseUrl}movie/upcoming?api_key=${ApiConstants.apiKey}');
    if (resp.statusCode == 200) {
      return resp.data;
    }else{
      throw Exception(resp.statusMessage);
    }
  }

  dynamic getDetails(int id) async {
    final resp = await Dio().get('${ApiConstants.baseUrl}movie/${id}?api_key=${ApiConstants.apiKey}');
    if (resp.statusCode == 200) {
      return resp.data;
    }else{
      throw Exception(resp.statusMessage);
    }
  }

  dynamic getSearch(String searchTerm) async {
    final resp = await Dio().get('${ApiConstants.baseUrl}search/movie?api_key=${ApiConstants.apiKey}&query=${searchTerm}');
    if (resp.statusCode == 200) {
      return resp.data;
    }else{
      throw Exception(resp.statusMessage);
    }
  }

  dynamic getVideo(int id) async {
    final resp = await Dio().get('${ApiConstants.baseUrl}movie/${id}/videos?api_key=${ApiConstants.apiKey}');
    if (resp.statusCode == 200) {
      return resp.data;
    }else{
      throw Exception(resp.statusMessage);
    }
  }

  dynamic getGenres() async {
    final resp = await Dio().get('${ApiConstants.baseUrl}genre/movie/list?api_key=${ApiConstants.apiKey}');
    if (resp.statusCode == 200) {
      return resp.data;
    }else{
      throw Exception(resp.statusMessage);
    }
  }
}