import 'package:dio/dio.dart';
import 'package:fiverrr/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<bool> login(
      {required String email, required String password}) async {
    try {
      var response = await Dio().post("${AppConstants.baseUrl}auth/login",
          data: {'email': email, 'password': password});

      if (response.statusCode == null) {
        return false;
      }

      if (response.statusCode! >= 400) {
        return false;
      }

      print("Successfully logged in");
      print(response.data);

      String token = response.data["token"];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.token, token);

      return true;
    } on DioError catch (e) {
      print(e.response?.data);
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static Future<bool> register(
      {required String email, required String password}) async {
    try {
      var response = await Dio().post("${AppConstants.baseUrl}auth/register",
          data: {'email': email, 'password': password});

      if (response.statusCode == null) {
        return false;
      }

      if (response.statusCode! >= 400) {
        return false;
      }

      print("Successfully registered");
      print(response.data);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
