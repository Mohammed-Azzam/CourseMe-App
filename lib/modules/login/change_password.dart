import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/modules/home/home_screen.dart';
import 'package:my_shop/modules/login/login_screen.dart';

import '../../component/component.dart';
import '../../models/model.dart';
import '../../models/user_model.dart';
import '../register/registerCubit.dart';

class ChangePassowrd extends StatefulWidget {
  @override
  State<ChangePassowrd> createState() => _ChangePassowrdState();
}

class _ChangePassowrdState extends State<ChangePassowrd> {
  var _displayNameController = TextEditingController();
  var _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  var _repeatPasswordController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;
  final formKey = GlobalKey<FormState>();
  var newPassword = '';

  // @override
  // void initState() {
  //   _displayNameController.text = widget.currentUser!.displayName;
  //   super.initState();
  // }

  @override
  void dispose() {
    _newPasswordController.dispose();
    super.dispose();
  }

  changePassword() async {
    try {
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black26,
          content: Text("Your password has been Changed.. Login again"),
        ),
      );
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFECB7BF),
        title: Text(
          "Change Passowrd",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Playfair Display",
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "Enter your new password\nbelow.",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Playfair Display"),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              // defaultFormField2(
              //   onFieldSubmitted: (value) {},
              //   controller: _passwordController,
              //   textKeyboard: TextInputType.text,
              //   prefix: Icons.lock_outline,
              //   validate: (value) {
              //     if (value!.isEmpty) return 'Enter password';
              //     if (value.length < 6) return 'Password is too short';
              //   },
              //   textLabel: 'Current Password',
              // ),
              defaultFormField2(
                onFieldSubmitted: (value) {},
                controller: _newPasswordController,
                textKeyboard: TextInputType.text,
                prefix: Icons.lock_outline,
                validate: (value) {
                  if (value == null || value.isEmpty || value.length < 6) return null;
                },
                textLabel: 'New Password',
              ),
              // defaultFormField2(
              //   onFieldSubmitted: (value) {},
              //   controller: _repeatPasswordController,
              //   textKeyboard: TextInputType.text,
              //   prefix: Icons.lock_outline,
              //   validate: (value) {
              //     return _newPasswordController.text == value
              //         ? null
              //         : "Please validate your entered password";
              //     // if (value!.isEmpty) return 'Enter password';
              //     // if (value.length < 6)
              //     //   return 'Password is too short';
              //   },
              //   textLabel: 'Confirm New Password',
              // ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        newPassword = _newPasswordController.text;
                      });
                      changePassword();
                    }
                    // var userController = locator.get<UserController>();
                    // if(widget.currentUser.name != _displayNameController.text)
                    //{
                    // var displayName = _displayNameController.text;

                    //}
                    if (formKey.currentState!.validate()) {
                      navigatorTo2(context, HomeScreen());
                    }
                  },
                  child: Text(
                    "Change Password",
                    style: TextStyle(fontSize: 18),
                  )),
              // defaultButton4(
              //     text: 'SAVE',
              //     fun: () {
              //       if (formKey.currentState!.validate()) {
              //         setState(() {
              //           newPassword = _newPasswordController.text;
              //         });
              //         changePassword();
              //       }
              //       // var userController = locator.get<UserController>();
              //       // if(widget.currentUser.name != _displayNameController.text)
              //       //{
              //       // var displayName = _displayNameController.text;
              //
              //       //}
              //       if (formKey.currentState!.validate()) {
              //         navigatorTo2(context, HomeScreen());
              //       }
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}
