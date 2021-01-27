import 'package:flutter/material.dart';
import 'package:flutter_mvc/controllers/authentication_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends StateMVC<RegisterScreen> {
  AuthencationController _authencationController;

  _RegisterScreenState() : super(AuthencationController()) {
    this._authencationController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _authencationController.scaffoldKey,
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _authencationController.formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (item) =>
                        item.length > 2 ? null : "Enter valid name",
                    onSaved: (item) =>
                        _authencationController.registerModel.name = item,
                    decoration: InputDecoration(
                        hintText: "Name", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (item) =>
                        item.contains("@") ? null : "Enter valid email",
                    onSaved: (item) =>
                        _authencationController.registerModel.email = item,
                    decoration: InputDecoration(
                        hintText: "Email", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText:
                        _authencationController.showPassword ? true : false,
                    onSaved: (item) =>
                        _authencationController.registerModel.password = item,
                    validator: (item) => item.length > 6
                        ? null
                        : "Password should be more than 6 chars",
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            icon: Icon(_authencationController.showPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _authencationController.showPassword =
                                    !_authencationController.showPassword;
                              });
                            })),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      _authencationController.register();
                    },
                    child: Text("Register"),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
