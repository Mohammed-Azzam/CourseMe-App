import 'package:flutter/material.dart';

import '../models/course_model.dart';
// import 'package:get_it/get_it.dart';

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
CourseModel? carusalModel;
String? uId = '';
String? uId2 = '';
// final locator = GetIt.instance;

abstract class ThemeText {
  static const TextStyle progressHeader = TextStyle(
      fontFamily: 'Playfair Display',
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.bold);
}

