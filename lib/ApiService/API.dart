import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class API extends http.BaseClient {
  // final String baseURL = 'http://jsonplaceholder.typicode.com';
  final String baseURL = 'https://www.lauwba.com/webservices/get_latest_news';
  http.Client client;

  API() {
    this.client = new http.Client();
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return this.client.send(request);
  }
}