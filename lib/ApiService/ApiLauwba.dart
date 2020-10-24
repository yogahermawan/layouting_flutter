import 'dart:convert';

import 'package:layouting/ApiService/DetailResponse.dart';
import 'package:layouting/ApiService/ListBeritaResponse.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://www.lauwba.com/webservices/";

class Api {
  static Future<ListBeritaResponse> getNews() async {
    var url = baseUrl + "get_latest_news";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ListBeritaResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get news");
    }
  }

  static Future<DetailResponse> getDetailNews(String idNews) async {
    var url = baseUrl + "get_detail_news/$idNews";
    final respone = await http.get(url);
    if (respone.statusCode == 200)
      return DetailResponse.fromJsonMap(jsonDecode(respone.body));
    else
      throw Exception("No Data to Load");
  }
}