class CourseModel {
  late dynamic name;
  late String uId;
  late dynamic category;
  late dynamic image;

  CourseModel(
      {required this.name,
        required this.category,
        required this.image,
      });

  CourseModel.fromJson(Map<String, dynamic>? json) {
    name = json!["name"];
    // uId = json["uId"];
    category = json["category"];
    image = json["image"];
  }



  Map<dynamic, dynamic>? toMap() {
    return {
      "name": name,
      // "uId": uId,
      "category": category,
      "image": image,
    };
  }
}
