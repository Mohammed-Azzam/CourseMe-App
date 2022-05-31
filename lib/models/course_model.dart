import 'package:flutter/material.dart';

class CourseModel {
  String? name;
  dynamic category;
  String? numberOfLessons;
  dynamic id;
  dynamic teacher_By;
  dynamic image;

  CourseModel({this.name, this.id, this.teacher_By, this.category, this.image, this.numberOfLessons});

  //if i want to write on firebase i need to convert the data to map (json)

  Map<dynamic, dynamic> toJson() {
    final Map data = Map<dynamic, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['teacher_By'] = this.teacher_By;
    data['category'] = this.category;
    data['image'] = this.image;
    data['numberOfLessons'] = this.numberOfLessons;
    return data;
  }

// if i need to read data form firebase convert data from json to .....

  CourseModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    teacher_By = json['teacher_By'];
    category = json['category'];
    image = json['image'];
    numberOfLessons = json['numberOfLessons'];
  }
}
