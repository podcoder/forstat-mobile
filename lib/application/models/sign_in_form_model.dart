import 'package:forsat/application/classes/common_error.dart';

class SignInFormModel {
  String email;
  String password;

  void setEmail(String email) {
    // check the email validation
    if (!validateEmail(email)) {
      throw CommonError(message: "Invalide email");
    }

    this.email = email;
  }

  void setPassword(String password) {
    // check the password validation
    if (password.length < 6) {
      throw CommonError(message: "Password lenght should be more than 6 chars");
    }

    this.password = password;
  }

  bool validateData() {
    return this.email != null &&
        this.password != null &&
        this.password.length > 6 &&
        this.validateEmail(this.email);
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  submitSignIn() {
    // authenticate
  }
}
