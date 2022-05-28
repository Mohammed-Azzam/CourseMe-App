class PaidCourseModel {
  late String name;
  late String uId;
  late String image;

  PaidCourseModel(
      {required this.name, required this.uId, required this.image});

  PaidCourseModel.fromJson(Map<String, dynamic>? json) {
    name = json!["name"];
    uId = json["uId"];
    image = json["image"];
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "uId": uId,
      "image": image,
    };
  }
}
