import 'dart:async';
import 'dart:convert' as Convert;
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

typedef RequestCallBack = void Function(Map data);

class HttpRequest {
  static Future<Map<String, dynamic>> get(String url) async {
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    Map<String, dynamic> result = jsonDecode(reply);
    return result;
  }

  static Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> params) async {
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request = await client.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(params)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    Map<String, dynamic> result = jsonDecode(reply);
    return result;
  }
}
