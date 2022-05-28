import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_shop/modules/cart/cart_screen.dart';
import 'package:my_shop/modules/courses/course_detail.dart';
import 'package:my_shop/modules/courses/course_screen.dart';
import 'package:my_shop/modules/home/HomeCubit.dart';
import 'package:my_shop/modules/home/home_screen.dart';
import 'package:my_shop/modules/login/forget_password.dart';
import 'package:my_shop/modules/products/product_screen.dart';
import 'package:my_shop/modules/products/product_detail_screen.dart';
import 'package:my_shop/modules/register/register_screen.dart';
import 'package:my_shop/modules/splach/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:my_shop/shared/helper/cache_helper.dart';
import 'constans/const.dart';
import 'modules/home/HomeStates.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:http/http.dart';
import 'modules/login/change_password.dart';
import 'modules/login/login_screen.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("on a background message: ${message.messageId}");
//   print(message.data.toString());
//   Fluttertoast.showToast(
//     msg: 'on a background message ',
//     toastLength: Toast.LENGTH_LONG,
//     timeInSecForIosWeb: 3,
//     backgroundColor: social3,
//     textColor: Colors.white,
//     gravity: ToastGravity.BOTTOM,
//   );
// }
void main() async {
  HttpOverrides.global = new MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  uId = CacheHelper.getData(key: "uId");
  print(uId);
  Widget? widget;
  if (uId == null) {
    widget = LoginScreen();
  } else {
    widget = HomeScreen();
  }

  runApp(MyShop(
    widget: widget,
  ));
}

class MyShop extends StatelessWidget {
  Widget? widget;

  MyShop({required this.widget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          return MaterialApp(
            // title: 'Flutter Demo',
            // theme: ThemeData(
            // ),
            home:HomeScreen(),
            debugShowCheckedModeBanner: false,
          );
        },

      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient( context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
