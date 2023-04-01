class LoginResponse {
  late final bool isValid;
  late final bool passwordError;
  late final bool emailError;
  late final bool serverError;
  late final String? token;

  LoginResponse({
    this.isValid = true,
    this.passwordError = false,
    this.emailError = false,
    this.serverError = false,
    this.token,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    isValid = json["status"] == "success";
    if (json["error"] != null) {
      passwordError = json['error']["password"] != null;
      emailError = json['error']["email"] != null;
    }

    token = json["token"];

    // if error is not based on password and email
    if (!isValid && !passwordError && !emailError) {
      serverError = true;
    } else {
      serverError = false;
    }
  }
}
