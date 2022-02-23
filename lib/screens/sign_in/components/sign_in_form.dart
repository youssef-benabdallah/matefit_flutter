import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:ubung_4/global_variable.dart';
import 'package:ubung_4/helper/keyboard.dart';
import 'package:ubung_4/model/user.dart';
import 'package:ubung_4/screens/components/default_button.dart';
import 'package:ubung_4/screens/components/form_error.dart';
import 'package:ubung_4/screens/welcome/welcome_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  Future <void> showAlertDialog(BuildContext context) async{
    return await showDialog(context: context, builder: (context){
      return AlertDialog(
        content: Text("Password or Email isn't correct"),
        title: Text("Invalid login details",style: TextStyle(color: Colors.red)),
        actions: [
          TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Okay",style: TextStyle(color: Colors.black),)),
        ],
      );
    });

  }

  Future<void> signInCheck(BuildContext context) async {

    try{
      final response = await http.post(Uri.parse('https://matefit-test.herokuapp.com/api/login'), headers: {
        'Accept': 'application/json',

      },  body: {
        'email': 'kevin@matefit.com',
        'password': 'kevinkevin',
        // 'email': email,
        // 'password': password,
      });

      switch (response.statusCode) {
        case 200:
          final user = json.decode(response.body);
          print(user);

          connectedUser = User.fromJson(user);
          userToken = user["token"] as String;
          print(connectedUser.toString());
          Navigator.pushNamed(context, WelcomeScreen.routeName);
          break;
        case 401:
          print(json.decode(response.body));
          showAlertDialog(context);
          print('error');
          break;
        default:
          print(json.decode(response.body));
          break;
      }
    } on SocketException {
      print("Server error. Please retry");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),

          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                signInCheck(context);
                // Navigator.pushNamed(context, 'LoginSuccessScreen.routeName');
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }


  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.mail),
      ),
    );
  }
}


