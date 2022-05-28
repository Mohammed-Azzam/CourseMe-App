import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_shop/component/component.dart';
import 'package:my_shop/widget/listview_screen.dart';
import 'package:my_shop/modules/register/register_screen.dart';
import '../../constans/const.dart';
import '../../constans/const.dart';
import '../../shared/helper/cache_helper.dart';
import '../../styles/color.dart';
import '../home/HomeCubit.dart';
import '../home/home_screen.dart';
import '../register/registerCubit.dart';
import 'LoginCubit.dart';
import 'LoginState.dart';
import 'forget_password.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
        if (state is LoginErrorState) {
          Fluttertoast.showToast(
              msg: state.error,
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_LONG,
              fontSize: 18,
              backgroundColor: Colors.red,
              textColor: Colors.white);
        }
        if (state is LoginSuccessState) {
          Fluttertoast.showToast(
            msg: "welcome with you",
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG,
            fontSize: 18,
            backgroundColor: social3,
          );
          CacheHelper.saveData(key: 'uId', value: state.uId);

              // .then((value) {
            NavigatorAndFinish(
              context,
              HomeScreen(),
            );

            uId = state.uId;
            // HomeCubit.get(context).getUserData();
            // if (HomeCubit.get(context).model != null) {
            //   CacheHelper.saveData(
            //       key: 'isLight',
            //       value: HomeCubit.get(context).model!.theme)
            //       .then((value) {
            //     HomeCubit.get(context).getPost();
            //     HomeCubit.get(context).getStories();
            //     HomeCubit.get(context).getPersonalStory2();
            //   });
            // }
          // });
        }
      }, builder: (context, state) {
        var bloc1 = LoginCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              Expanded(
                child: Image.asset(
                  "assets/images/background.png",
                  fit: BoxFit.cover,
                  height: screenHeight,
                  width: screenWidth,
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          defaultFormField2(
                            controller: emailController,
                            textKeyboard: TextInputType.emailAddress,
                            validate: (value) {
                              if (value!.isEmpty)
                                return 'Please enter your Email';
                            },
                            textLabel: "Email",
                            prefix: Icons.email_outlined,
                          ),
                          defaultFormField2(
                              onFieldSubmitted: (value) {
                                if (state is LoginLoadingState) {
                                  Center(child: CircularProgressIndicator());
                                } else {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                }
                              },
                              controller: passwordController,
                              textKeyboard: TextInputType.text,
                              prefix: Icons.lock_outline,
                              validate: (value) {
                                if (value!.isEmpty)
                                  return 'Password is too short';
                              },
                              textLabel: 'Password',
                              isPassword: LoginCubit.get(context).isPassword,
                              suffixPressed: () {
                                LoginCubit.get(context).passwordVisibility();
                              },
                              suffix: LoginCubit.get(context).suffix),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: ()
                              {
                                navigatorTo4(context, ForgetPassword());
                              },
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(
                                    fontFamily: "Playfair Display",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFFECB7BF)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          state is LoginLoadingState
                              ? Center(child: CircularProgressIndicator())
                              : defaultButton4(
                                  text: "LOGIN",
                                  fun: () {
                                    if (formKey.currentState!.validate()) {
                                      bloc1.userLogin(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  }),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50,right: 56,left: 49),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?',
                          style: TextStyle(
                              fontFamily: "Playfair Display",
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey.withOpacity(0.8)),),
                      textButton(
                          text: "Register Now",
                          fun: () {
                            navigatorTo3(context, RegisterScreen());
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutterxd_login/component/component.dart';
//
// import 'forget_password.dart';
//
// class LoginScreen extends StatelessWidget {
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0.0,
//           backgroundColor: Colors.white,
//           title: Align(
//               alignment: Alignment.center,
//               child: Text(
//                 "LOGIN",
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//               )),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20),
//           child: Column(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       children: [
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Welcome back",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Enter email & password",
//                             style: TextStyle(
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15, right: 15),
//                 child: defaultFormField2(
//                     controller: emailController,
//                     type: TextInputType.emailAddress,
//                     label: "Email",
//                     prefix: Icons.email_outlined,
//                     textLabel: 'Enter your email',
//                     textKeyboard: TextInputType.emailAddress),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15, right: 15),
//                 child: defaultFormField2(
//                     controller: emailController,
//                     type: TextInputType.visiblePassword,
//                     label: "Password",
//                     prefix: Icons.lock,
//                     textLabel: 'Enter your Password',
//                     textKeyboard: TextInputType.visiblePassword),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15, right: 10),
//                 child: defaultButton4(text: 'LOGIN', fun: () {}),
//               ),
//               SizedBox(
//                 height: 18,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Don't have an account?",
//                     textAlign: TextAlign.center,
//                     style:
//                     TextStyle(
//                         fontWeight: FontWeight.w500),
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   Text(
//                     "Create Now!",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 18,
//               ),
//               Text(
//                 "Forget Password",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.blue,
//                 fontWeight: FontWeight.w500),
//               ),
//             ],
//           ),
//         ));
//   }
// }
