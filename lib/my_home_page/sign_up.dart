// ignore_for_file: deprecated_member_use


import 'package:capstone_project_four/auth/auth.dart';
import 'package:capstone_project_four/constant/loading.dart';
import 'package:capstone_project_four/constant/round_button.dart';
import 'package:capstone_project_four/my_home_page/gesture_text.dart';
import 'package:capstone_project_four/register.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';

  String password = '';

  String error = '';

  bool loading = false;

  @override
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return loading
        ? Loading()
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Sign_up',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      buildTextFormFieldEmail(),
                      SizedBox(
                        height: 20,
                      ),
                      buildTextFormFieldPassword(),
                      SizedBox(
                        height: 20,
                      ),
                      RoundButton(
                        text: 'Login',
                        press: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error =
                                    'could not sign in with those credentials';
                                loading = false;
                              });
                            }
                          }
                        },
                        color: Colors.blue,
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(fontSize: 15),
                          ),
                          GestureText(
                            press: () {
                              Navigator.pushNamed(context, Register.routesName);
                            },
                            text: 'Register',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  TextFormField buildTextFormFieldPassword() {
    return TextFormField(
      validator: (value) =>
          value!.length < 6 ? 'password must be greater than 6' : null,
      onChanged: (value) {
        setState(() => password = value);
      },
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'password',
          hintText: '**********',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(style: BorderStyle.solid, color: Colors.black)),
          suffixIcon: Icon(Icons.password)),
    );
  }

  TextFormField buildTextFormFieldEmail() {
    return TextFormField(
      validator: (value) => value!.isEmpty ? 'input your email' : null,
      onChanged: (value) {
        setState(() => email = value);
      },
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Email',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(style: BorderStyle.solid, color: Colors.black)),
          suffixIcon: Icon(Icons.email)),
    );
  }
}
