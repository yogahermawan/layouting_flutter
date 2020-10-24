import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:layouting/ApiService/API.dart';

class ApiService extends API {

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return this.client.send(request);
  }
  Future<List<dynamic>> getPosts() async {
    var response = await this.get('https://www.lauwba.com/webservices/get_latest_news');
    Map result = convert.jsonDecode(response.body);
    return result['data'];
  }


  //   Future login(value) async {
  //   final body = json.encode(value);
  //   try {
  //     final response = await http
  //         .post("http://127.0.0.1:8080/auth/login.php",
  //             headers: {"Content-Type": "application/json"}, body: body)
  //         .timeout(Duration(minutes: 1))
  //         .catchError((onError) => print(onError));

  //     print('response code ' + response?.statusCode.toString());
  //     print('response code ' + response?.body.toString());
  //     if (response?.statusCode == 200) {
  //       final res = LoginResult.fromJson(json.decode(response.body));
  //       return res;
  //     }
  //   } catch (e) {
  //     print("=======================timeout======================");
  //     print(e);
  //     return null;
  //   }
  // }
}