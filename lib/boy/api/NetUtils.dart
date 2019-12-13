import 'dart:async';
import 'package:http/http.dart' as http;
//封装请求方法
class NetUtils {
  static Future<String> get(String url, {Map<String, String> params}) async {
    //拼接参数
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer();

      params.forEach((key, value) {
        sb.write('$key' + '=' + '$value' + '&');
      });

      url = url + sb.toString().substring(0, sb.toString().length - 1);
    }
    http.Response response = await http.get(url);
    return response.body;
  }

  static Future<String> post(String url, Map<String, String> params) async {
    http.Response response = await http.post(url, body: params);
    var body2 = response.body;

    print(body2);

    return body2;
  }
}
