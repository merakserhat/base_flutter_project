import 'package:fiverrr/constants/app_constants.dart';
import 'package:fiverrr/screens/auth_screen.dart';
import 'package:fiverrr/services/app_client.dart';
import 'package:fiverrr/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //means at leas show this screen 2 seconds when app is opening
  bool showSplashScreen = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showSplashScreen = false;
      });
    });
    initializeAuthentication();
  }

  void initializeAuthentication() {
    SharedPreferences.getInstance().then((prefs) {
      String? token = prefs.getString(AppConstants.token);

      if (token == null || token.isEmpty) {
        // Token yok ya da boş
        Navigator.of(context).pushReplacement(
            CupertinoPageRoute(builder: (_) => const AuthScreen()));
        return;
      }

      AuthService.validateToken(token: token).then(
        (validated) {
          if (validated) {
            //TODO: burada home screen'a yönlendir. Validate ettik
            AppClient().token = token;
          } else {
            //Token validate değil
            Navigator.of(context).pushReplacement(
                CupertinoPageRoute(builder: (_) => const AuthScreen()));
          }
        },
      ).catchError((error) {
        //Token var ama validate ederken hata çıktı
        Navigator.of(context).pushReplacement(
            CupertinoPageRoute(builder: (_) => const AuthScreen()));
      });
    }).catchError(
      (error) {
        // Token'ı ararken hata çıktı
        Navigator.of(context).pushReplacement(
            CupertinoPageRoute(builder: (_) => const AuthScreen()));
        return;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: CircularProgressIndicator(),
        )
      ],
    );
  }
}
