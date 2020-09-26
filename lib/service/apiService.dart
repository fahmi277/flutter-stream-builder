import 'package:dio/dio.dart';
import 'apiKey.dart';

// Future<void> main() async {
//   String Value = await getHttp();
//   print(Value);
// }

Future<String> getHttp(int bangunan,String pin) async {
  // String pin = "V0";
  String base = "http://blynk-cloud.com/";
  String path = "/get/" + pin;
  String token = "";

  if (bangunan == 1) {
    token = getApiKey().sinyal1;
  } else if (bangunan == 2) {
    token = getApiKey().sinyal2;
  } else if (bangunan == 3) {
    token = getApiKey().sinyal3;
  } else if (bangunan == 4) {
    token = getApiKey().sinyal4;
  }
  // String token = getApiKey().sinyal1;

  String responValue;

  String link = base + token + path;
  try {
    Response response = await Dio().get(link);
    print(response.data[0]);
    responValue = response.data[0];
    responValue = double.tryParse(responValue).toStringAsFixed(1).toString();
    return responValue;
  } catch (e) {
    // print(e);
    return "0";
  }
}
