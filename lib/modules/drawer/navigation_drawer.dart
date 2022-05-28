import 'package:flutter/material.dart';
import 'package:my_shop/modules/courses/course_screen.dart';
import 'package:my_shop/modules/home/home_screen.dart';
import 'package:my_shop/modules/login/login_screen.dart';

import '../cart/cart_screen.dart';
import '../login/change_password.dart';
import '../login/forget_password.dart';
import '../news/news_screen.dart';
import '../products/product_screen.dart';
import '../profile/profile_screen.dart';
import '../settings/settings_screen.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://as2.ftcdn.net/v2/jpg/03/17/05/31/1000_F_317053184_0PuObMgWsfiBMNeOdPBamUAFix5wQEuH.jpg")),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Maya",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Playfair Display",
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              buildMenuItem(
                  text: "Home",
                  icon: Icons.home,
                  onClicked: () {
                    selectedItem(context, 0);
                  }),
              Divider(),
              buildMenuItem(
                  text: "Course",
                  icon: Icons.work_outlined,
                  onClicked: () {
                    selectedItem(context, 1);
                  }),
              Divider(),
              buildMenuItem(
                  text: "News",
                  icon: Icons.menu_book_sharp,
                  onClicked: () {
                    selectedItem(context, 2);
                  }),
              Divider(),
              buildMenuItem(
                  text: "Products",
                  icon: Icons.production_quantity_limits_sharp,
                  onClicked: () {
                    selectedItem(context, 3);
                  }),
              Divider(),
              buildMenuItem(
                  text: "cart",
                  icon: Icons.shopping_cart_outlined,
                  onClicked: () {
                    selectedItem(context, 4);
                  }),
              Divider(),
              buildMenuItem(
                  text: "My Profile",
                  icon: Icons.person_pin,
                  onClicked: () {
                    selectedItem(context, 5);
                  }),
              Divider(),
              buildMenuItem(
                  text: "Settings",
                  icon: Icons.settings,
                  onClicked: () {
                    selectedItem(context, 6);
                  }),
              Divider(),
              buildMenuItem(
                  text: "Logout",
                  icon: Icons.logout,
                  onClicked: () {
                    selectedItem(context, 7);
                  }),
              Divider(),
            ]),
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final colorIcon = Color(0xFFFBD2D7);
  final colorText = Colors.black;
  final hoverColor = Colors.black38;
  return ListTile(
    leading: Icon(
      icon,
      color: colorIcon,
    ),
    title: Text(text,
        style: TextStyle(
            color: colorText,
            fontFamily: "Playfair Display",
            fontSize: 15,
            fontWeight: FontWeight.bold)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      break;
    case 1:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CoursesScreen()));
      break;
    case 2:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => NewsScreen()));
      break;
    case 3:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ProductScreen()));
      break;
    case 4:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CartScreen()));
      break;
    case 5:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ChangePassowrd()));
      break;
    case 6:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SettingsScreen()));
      break;
    case 7:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginScreen()));
      break;
  }
}
