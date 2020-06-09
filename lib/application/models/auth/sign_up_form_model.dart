import 'package:forsat/application/classes/errors/common_error.dart';
import 'package:forsat/application/state/auth_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignUpFormModel {
  final AuthState _authState = Injector.get<AuthState>();

  String firstName;
  String lastName;
  String email;
  String password;
  String passwordConfirmation;

  void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  void setLastName(String lastName) {
    this.lastName = lastName;
  }

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

  void setPasswordConfirmation(String passwordConfirmation) {
    if (this.password != passwordConfirmation) {
      throw CommonError(message: "Password does not match");
    }
    this.passwordConfirmation = passwordConfirmation;
  }

  bool validateData() {
    return this.firstName != null &&
        this.lastName != null &&
        this.email != null &&
        this.validateEmail(this.email) &&
        this.password != null &&
        this.password.length >= 6 &&
        this.password == this.passwordConfirmation;
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  // Submit the Sign Up form to the server
  void submitSignUp() async {
    await _authState.signUp(
      firstName: this.firstName,
      lastName: this.lastName,
      email: this.email,
      password: this.password,
      passwordConfirmation: this.passwordConfirmation,
    );
  }
}
