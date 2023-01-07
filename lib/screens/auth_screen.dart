import 'package:fiverrr/services/auth_service.dart';
import 'package:fiverrr/services/temp_service.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isRegisterLoading = false;
  bool isLoginLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("Email"),
                  TextField(
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Text("Password"),
                  TextField(
                    controller: passwordController,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  isLoginLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isLoginLoading = true;
                            });
                            print("Login clicekd");
                            await AuthService.login(
                                email: emailController.text,
                                password: passwordController.text);
                            setState(() {
                              isLoginLoading = false;
                            });
                          },
                          child: Text("Login"),
                        ),
                  isRegisterLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isRegisterLoading = true;
                            });
                            print("Register clicekd");
                            await AuthService.register(
                                email: emailController.text,
                                password: passwordController.text);
                            setState(() {
                              isRegisterLoading = false;
                            });
                          },
                          child: Text("Register"),
                        ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  await TempService.temp();
                },
                child: Text("See groceries"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
