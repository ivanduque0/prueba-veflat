import 'dart:convert';
import 'package:http/http.dart' as http;

import 'constants.dart';

enum RequestMethods { GET, POST, PUT, DELETE }

class RestRequests {
  Future<RestResponse> get(String path, {Map<String, dynamic>? params}) async {
    final url = Uri.https(Constants.baseUrl, '/api/$path', params ?? {});
    var response = await http.get(url);
    return RestResponse(method: RequestMethods.GET, code: response.statusCode, body: jsonDecode(response.body));
  }

  Future<RestResponse> post(String path, {String? token, Map? bodyMap}) async {
    final url = Uri.https(Constants.baseUrl, '/api/$path');
    String bodyString = bodyMap != null ? jsonEncode(bodyMap) : "";
    var response = await http.post(url,
        body: bodyString,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': token ?? ''});
    return RestResponse(method: RequestMethods.POST, code: response.statusCode, body: jsonDecode(response.body));
  }

  Future<RestResponse> put(String path, {String? token, Map? bodyMap}) async {
    final url = Uri.https(Constants.baseUrl, '/api/$path');
    String bodyString = bodyMap != null ? jsonEncode(bodyMap) : "";
    var response = await http.put(url,
        body: bodyString,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': token ?? ''});
    return RestResponse(method: RequestMethods.PUT, code: response.statusCode, body: jsonDecode(response.body));
  }

  Future<RestResponse> delete(String path, {String? token, Map? bodyMap}) async {
    final url = Uri.https(Constants.baseUrl, '/api/$path');
    String bodyString = bodyMap != null ? jsonEncode(bodyMap) : "";
    var response = await http.delete(url,
        body: bodyString,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': token ?? ''});
    return RestResponse(method: RequestMethods.DELETE, code: response.statusCode, body: jsonDecode(response.body));
  }
}

class RestResponse {
  int? code;
  dynamic body;
  RequestMethods? method;

  RestResponse({this.code, this.body, this.method});

  Map<String, Object?> toJson() {
    var data = <String, dynamic>{};
    data['code'] = code;
    data['body'] = body;
    data['method'] = method;

    return data;
  }
}
