class FreeCourseModel {
  late String name;
  late String uId;
  late String image;

  FreeCourseModel(
      {required this.name, required this.uId, required this.image});

  FreeCourseModel.fromJson(Map<String, dynamic>? json) {
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
