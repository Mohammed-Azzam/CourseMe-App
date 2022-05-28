import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_shop/component/component.dart';
import 'package:my_shop/widget/listview_screen.dart';
import 'package:my_shop/modules/login/login_screen.dart';
import 'LoginCubit.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  String _email = '';
  // late String _email2, _password;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background.png",
            width: screenWidth,
            fit: BoxFit.cover,
            height: screenHeight,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/screenforget.png",
                    height: 215,
                    width: 215,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 232,
                    height: 30,
                    child: Text(
                      "Forget Your Password",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Playfair Display"),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 64,
                    width: 301,
                    child: Text(
                      'Enter your registered email address\n'
                      'below to receive your password reset\n'
                      'instructions!',
                      style: TextStyle(
                          color: Color(0xFFBCBCBC),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Playfair Display"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: defaultFormField2(
                        // controller: emailController,
                        textKeyboard: TextInputType.emailAddress,
                        prefix: Icons.email_outlined,
                        // validate: (value) {
                        //   if (value!.isEmpty) return 'Please enter your Name';
                        //   if (value.length < 2) return 'Your name is too short';
                        // },
                        onchange: (value)
                        {
                          setState(() {
                            _email = value;
                          });
                        },
                        textLabel: 'Email Address'),
                  ),
                  Container(
                    // width: 315,
                    child: defaultButton4(
                        text: 'SEND',
                        fun: () {
                          auth.sendPasswordResetEmail(email: _email);
                          Navigator.of(context).pop();
                          // Navigator.of(context).pop();
                        }),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50, right: 56, left: 49),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                        fontFamily: "Playfair Display",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey.withOpacity(0.8)),
                  ),
                  textButton(
                      text: "Login Now",
                      fun: () {
                        navigatorTo3(context, LoginScreen());
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//   Future resetPassword() async
//   {
//     await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
//     MatrixUtils.
//   }
//   }
//   Future resetPassword() async {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => Center(child: CircularProgressIndicator(),),
//     );
//     try {
//       await FirebaseAuth.instance
//           .sendPasswordResetEmail(email: emailController.text.trim()).then((value)
//       //
//       {
//         // Fluttertoast.showToast(
//         //     msg: "Password Reset Email Sent",
//         //     textColor: Colors.white,
//         //     backgroundColor: Colors.red,
//         //     gravity: ToastGravity.BOTTOM,
//         //     toastLength: Toast.LENGTH_LONG
//         // );
//         Navigator.of(context).popUntil((route) => route.isFirst);
//       });
//     } on FirebaseAuthException catch (e)
//     {
//       print(e);
//       //
//       Navigator.of(context).pop();
//     }
//   }
// }
