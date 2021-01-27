import 'package:flutter/material.dart';
import 'package:flutter_mvc/models/register_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AuthencationController extends ControllerMVC {
  var scaffoldKey = GlobalKey<ScaffoldState>(); // screen
  var formKey = GlobalKey<FormState>(); // forms

  bool showPassword = false;

  RegisterModel registerModel;

  AuthencationController() {
    this.registerModel = RegisterModel();
  }

  register() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text("All Fields are correct: " + registerModel.name)));
    }
  }
}
