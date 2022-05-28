import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_shop/modules/courses/course_screen.dart';
import 'package:my_shop/modules/drawer/navigation_drawer.dart';
import 'package:my_shop/modules/home/home_screen.dart';
import 'package:my_shop/modules/register/register_screen.dart';

import '../modules/courses/my_courses_screen.dart';
import '../modules/login/forget_password.dart';
import '../shared/helper/cache_helper.dart';
import '../widget/listview_screen.dart';
import '../modules/login/login_screen.dart';

Widget defaultFormField2({
  TextEditingController? controller,
  required TextInputType textKeyboard,
  IconData? suffix,
  String helper = '',
  GestureTapCallback? onTaped,
  bool isPassword = false,
  required IconData prefix,
  ValueChanged<String>? onchange,
  ValueChanged<String>? onFieldSubmitted,
  FormFieldValidator<String>? validate,
  required String textLabel,
  VoidCallback? suffixPressed,
  TextInputType? type,
  String? label,
}) =>
    TextFormField(
      style: TextStyle(
          fontFamily: "Playfair Display", fontWeight: FontWeight.bold,),
      validator: validate,
      controller: controller,
      keyboardType: textKeyboard,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        helperText: '$helper',
        labelText: textLabel,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: suffixPressed,
              )
            : null,
      ),
      onChanged: onchange,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTaped,
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType textKeyboard,
  IconData? suffix,
  String? helper = '',
  GestureTapCallback? onTaped,
  bool isPassword = false,
  required IconData prefix,
  ValueChanged<String>? onchange,
  ValueChanged<String>? onFieldSubmitted,
  required FormFieldValidator<String> validate,
  required String textLabel,
  VoidCallback? suffixPressed,
}) =>
    TextFormField(
      validator: validate,
      controller: controller,
      keyboardType: textKeyboard,
      obscureText: isPassword,
      decoration: InputDecoration(       helperText: '$helper',

        labelText: textLabel,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
          icon: Icon(suffix),
          onPressed: suffixPressed,
        )
            : null,
        border: OutlineInputBorder(),
      ),
      onChanged: onchange,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTaped,
    );

Widget textButton({required String text, required VoidCallback? fun}) =>
    TextButton(onPressed: fun, child: Text(text,style: TextStyle(
        fontFamily: "Playfair Display",
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Color(0xFFECB7BF)),));

Widget defaultButton({
  double radius = 0,
  double width = double.infinity,
  Color color = Colors.blue,
  bool isUpper = true,
  required String text,
  required void fun(),
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        child: Text(
          " ${isUpper ? text.toUpperCase() : text} ",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: fun,
      ),
    );

Widget defaultButton4({
  double radius = 25,
  double width = 345,
  bool isUpper = true,
  required String text,
  required void fun(),
}) =>
    Container(
      width: width,
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xFFECB7BF),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        child: Text(
          " ${isUpper ? text.toUpperCase() : text} ",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Playfair Display",
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        onPressed: fun,
      ),
    );

navigatorTo1(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }));

navigatorTo2(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen();
    }));
// navigatorToPop(context, widget) =>
//     Navigator.of(context).pop();

navigatorTo3(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return RegisterScreen();
    }));

navigatorTo4(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ForgetPassword();
    }));

navigatorTo5(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NavigationDrawer();
    }));

navigatorToAll(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AllCoursesScreen();
    }));

navigatorToMy(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MyCoursesScreen();
    }));

void NavigatorAndFinish(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return HomeScreen();
  }));
}

Widget TextStyle2(
        {Color? color,
        String? fontFamily,
        FontWeight? fontWeight,
        int? fontSize}) =>
    TextStyle2(
        color: color,
        fontFamily: "Playfair Display",
        fontWeight: FontWeight.bold,
        fontSize: fontSize);

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      NavigatorAndFinish(context, LoginScreen());
      // ShopAppCubit.get(context).currentIndex = 0;
    }
  });
}