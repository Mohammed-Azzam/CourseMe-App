import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_shop/component/component.dart';
import 'package:my_shop/modules/home/HomeCubit.dart';
import 'package:my_shop/modules/register/registerCubit.dart';
import 'package:my_shop/modules/register/registerState.dart';
import 'package:my_shop/shared/helper/cache_helper.dart';
import '../../constans/const.dart';
import '../../styles/color.dart';
import '../home/home_screen.dart';
import '../login/login_screen.dart';
import '../../component/component.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var firstController = TextEditingController();
  var lastController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, CourseRegisterStates>(
          listener: (context, state) {
            if (state is RegisterErrorState) {
              Fluttertoast.showToast(
                  msg: state.error.toString(),
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_LONG,
                  fontSize: 18,
                  backgroundColor: Colors.red,
                  textColor: Colors.white);
            }
            if (state is ErrorRegister) {
              Fluttertoast.showToast(
                  msg: state.error.toString(),
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.red,
                  timeInSecForIosWeb: 5,
                  fontSize: 18);
            }
            if (state is SuccessCreateRegister) {
              Fluttertoast.showToast(
                  msg: "welcome with you",
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: social3,
                  timeInSecForIosWeb: 5,
                  fontSize: 18);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen()),
                      (route) => false);
            }
          }, builder: (context, state) {
        var bloc1 = RegisterCubit.get(context);
        return Scaffold(
          body: Stack(
            children:
            [
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
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 100),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          defaultFormField2(
                              controller: firstController,
                              textKeyboard: TextInputType.name,
                              prefix: Icons.person,
                              validate: (value) {
                                if (value!.isEmpty) return 'Please enter your Name';
                                if (value.length < 2)
                                  return 'Your name is too short';
                              },
                              textLabel: 'First Name'),
                          defaultFormField2(
                              controller: lastController,
                              textKeyboard: TextInputType.name,
                              prefix: Icons.person,
                              validate: (value) {
                                if (value!.isEmpty)
                                  return 'Please enter your Email';
                              },
                              textLabel: 'Last Name'),
                          defaultFormField2(
                              controller: emailController,
                              textKeyboard: TextInputType.emailAddress,
                              prefix: Icons.email_outlined,
                              validate: (value) {
                                // if (value!.isEmpty) return 'Please enter your Name';
                                // if (value.length < 2)
                                //   return 'Your name is too short';
                              },
                              textLabel: 'Email Address'),
                          defaultFormField2(
                              onFieldSubmitted: (value) {},
                              controller: passwordController,
                              textKeyboard: TextInputType.text,
                              prefix: Icons.lock_outline,
                              validate: (value) {
                                if (value!.isEmpty) return 'Enter password';
                                if (value.length < 6)
                                  return 'Password is too short';
                              },
                              textLabel: 'Password',
                              isPassword: RegisterCubit.get(context).isPassword,
                              suffixPressed: () {
                                RegisterCubit.get(context).passwordVisibility();
                              },
                              suffix: RegisterCubit.get(context).suffix),
                          ConditionalBuilderRec(
                            condition: state is! LoadingRegisterState,
                            builder: (context) => defaultButton4(
                                text: "REGISTER",
                                fun: () {
                                  if (formKey.currentState!.validate()) {
                                    bloc1.userRegister(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: firstController.text,
                                        phone: passwordController.text);
                                  }

                                }),
                            fallback: (context) => Container(
                              margin: EdgeInsets.only(bottom: 69, left: 250),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60)),
                              child: CircularProgressIndicator(
                                color: social1,
                              ),
                            ),
                          ),
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
                          text: "Login Now",
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
