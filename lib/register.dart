
import 'package:capstone_project_four/auth/auth.dart';
import 'package:capstone_project_four/constant/loading.dart';
import 'package:capstone_project_four/constant/round_button.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static final routesName = '\\register';

  @override
  State<Register> createState() => _RegisterState();

}

class _RegisterState extends State<Register> {
  @override
  String email = '';

  String password = '';

  String error = '';
  String firstName = '';
  String secondName = '';

  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return loading
        ? Loading()
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      buildTextFormFieldFirstName(),
                      SizedBox(
                        height: 20,
                      ),
                      buildTextFormFieldSecondName(),
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
                          text: 'Register',
                          press: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'please supply a supply a valid credentials';
                                  loading = false;
                                });
                              }
                            }
                          },
                          color: Colors.blue),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  TextFormField buildTextFormFieldEmail() {
    return TextFormField(
        validator: (value) => value!.isEmpty ? 'fill in your email' : null,
        onChanged: (value) {
          setState(() => email = value);
        },
        decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Email',
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.black, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(15)),
            suffixIcon: Icon(Icons.email)));
  }

  TextFormField buildTextFormFieldPassword() {
    return TextFormField(
      obscureText: true,
      validator: (value) =>
          value!.length < 6 ? 'password must be greater than 6' : null,
      onChanged: (value) {
        setState(() => password = value);
      },
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: '**********',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(15)),
          suffixIcon: Icon(Icons.password)),
    );
  }

  TextFormField buildTextFormFieldSecondName() {
    return TextFormField(
      validator: (value) => value!.isEmpty ? 'fill in your second name' : null,
      onChanged: (value) {
        setState(() => secondName = value);
      },
      decoration: InputDecoration(
          labelText: 'second name',
          hintText: 'second name',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(15)),
          suffixIcon: Icon(Icons.person)),
    );
  }

  TextFormField buildTextFormFieldFirstName() {
    return TextFormField(
      validator: (value) => value!.isEmpty ? 'fill in your first name' : null,
      onChanged: (value) {
        setState(() => firstName = value);
      },
      decoration: InputDecoration(
          labelText: 'first name',
          hintText: 'first name',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(15)),
          suffixIcon: Icon(Icons.person)),
    );
  }
}
