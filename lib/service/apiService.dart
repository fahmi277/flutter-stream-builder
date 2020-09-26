import 'package:dio/dio.dart';
import 'apiKey.dart';

// Future<void> main() async {
//   String Value = await getHttp();
//   print(Value);
// }

Future<String> getHttp() async {
  String pin = "V0";
  String base = "http://blynk-cloud.com/";
  String path = "/get/" + pin;
  String token = getApiKey().sinyal1;

  String responValue;

  String link = base + token + path;
  try {
    Response response = await Dio().get(link);
    print(response.data[0]);
    responValue = response.data[0];
    responValue = double.tryParse(responValue).toStringAsFixed(1).toString();
    return responValue;
  } catch (e) {
    print(e);
    return "0";
  }
}
