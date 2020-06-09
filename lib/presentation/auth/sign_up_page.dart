import 'package:flutter/material.dart';
import 'package:forsat/application/models/auth/sign_up_form_model.dart';
import 'package:forsat/router/route_constants.dart';
import 'package:forsat/values/branding_color.dart';
import 'package:forsat/values/images.dart';
import 'package:forsat/widgets/show_snackbar.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
      ),
      body: Injector(
        inject: [Inject<SignUpFormModel>(() => SignUpFormModel())],
        builder: (context) {
          final _singletonSignUpFormModel =
              Injector.getAsReactive<SignUpFormModel>();
          return Container(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                Container(
                  height: 200,
                  child: Center(
                    child: Image.asset(Images.logo),
                  ),
                ),
                StateBuilder<SignUpFormModel>(
                  builder: (context, signUpFormMode) {
                    return TextFormField(
                      onChanged: (String firstName) {
                        signUpFormMode.setState(
                            (state) => state.setFirstName(firstName),
                            catchError: true);
                      },
                      decoration: InputDecoration(
                        errorText: signUpFormMode.hasError
                            ? signUpFormMode.error.message
                            : null,
                        prefixIcon: Icon(Icons.person),
                        hintText: "Enter your first name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    );
                  },
                ),
                buildSizedBox(15),
                StateBuilder<SignUpFormModel>(
                  builder: (context, signUpFormMode) {
                    return TextFormField(
                      onChanged: (String lastName) {
                        signUpFormMode.setState(
                            (state) => state.setLastName(lastName),
                            catchError: true);
                      },
                      decoration: InputDecoration(
                        errorText: signUpFormMode.hasError
                            ? signUpFormMode.error.message
                            : null,
                        prefixIcon: Icon(Icons.person),
                        hintText: "Enter your last name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    );
                  },
                ),
                buildSizedBox(15),
                StateBuilder<SignUpFormModel>(
                  builder: (context, signUpFormMode) {
                    return TextFormField(
                      onChanged: (String email) {
                        signUpFormMode.setState(
                            (state) => state.setEmail(email),
                            catchError: true);
                      },
                      decoration: InputDecoration(
                        errorText: signUpFormMode.hasError
                            ? signUpFormMode.error.message
                            : null,
                        prefixIcon: Icon(Icons.email),
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    );
                  },
                ),
                buildSizedBox(15),
                StateBuilder<SignUpFormModel>(
                  builder: (_, signFormModel) {
                    return TextFormField(
                      onChanged: (String password) {
                        signFormModel.setState(
                            (state) => state.setPassword(password),
                            catchError: true);
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText: signFormModel.hasError
                            ? signFormModel.error.message
                            : null,
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Enter a password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    );
                  },
                ),
                buildSizedBox(15),
                StateBuilder<SignUpFormModel>(
                  builder: (_, signFormModel) {
                    return TextFormField(
                      onChanged: (String passwordConfirmation) {
                        signFormModel.setState(
                            (state) => state
                                .setPasswordConfirmation(passwordConfirmation),
                            catchError: true);
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText: signFormModel.hasError
                            ? signFormModel.error.message
                            : null,
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Enter password confirmation",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    );
                  },
                ),
                buildSizedBox(25),
                StateBuilder(
                  models: [_singletonSignUpFormModel],
                  builder: (_, model) {
                    return MaterialButton(
                      onPressed: () {
                        if (!_singletonSignUpFormModel.state.validateData()) {
                          showSnackbar(
                            key: _key,
                            message:
                                "Invalid data, kindly fill the form correctly!",
                            color: Colors.red,
                          );
                        } else {
                          _singletonSignUpFormModel.state.submitSignUp();
                        }
                      },
                      height: 55,
                      shape: StadiumBorder(),
                      color: brandingColor,
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    );
                  },
                ),
                buildSizedBox(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("Already have an account ? "),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, signInRoute);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox buildSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }
}
