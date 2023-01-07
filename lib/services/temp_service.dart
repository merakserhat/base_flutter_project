import 'package:dio/dio.dart';
import 'package:fiverrr/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TempService {
  static Future<bool> temp() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(AppConstants.token);

      if (token == null) {
        return false;
      }

      Dio dio = Dio();
      dio.options.headers["authorization"] = "Bearer $token";

      var response = await dio.get("${AppConstants.baseUrl}groceries");

      if (response.statusCode == null) {
        return false;
      }

      if (response.statusCode! >= 400) {
        return false;
      }

      print("Successfully see groceries in");
      print(response.data);

      return true;
    } on DioError catch (e) {
      print(e.response?.data);
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
