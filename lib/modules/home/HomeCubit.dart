import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/models/course_model.dart';

import '../../constans/const.dart';
import '../../models/course_model.dart';
import '../../models/course_model.dart';
import '../../models/user_model.dart';
import 'HomeStates.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  UserModel? model;
  CourseModel? courseModel;

  void getUserData() async {
    emit(GetCourseImageLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      model = UserModel.fromJson(value.data());
      emit(GetCourseImageSuccessState());
    }).catchError((error) {
      print("${error.toString()} in Home Cubit");
      emit(GetCourseImageErrorState(error.toString()));
    });
  }

  // void getCoursesData() {
  //   emit(GetCourseLoadingState());
  //   FirebaseFirestore.instance.collection('course').doc(uId2).get().then((value) {
  //     courseModel = CourseModel.fromJson(value.data());
  //     emit(GetCourseSuccessState());
  //   }).catchError((error) {
  //     print("${error.toString()} in Home Cubit");
  //     emit(GetCourseErrorState(error.toString()));
  //   });
  // }

  // get all the document in firebase
  // Future<QuerySnapshot<Map<String, dynamic>>> getCourses() async {
  //   QuerySnapshot<Map<String, dynamic>> allCourses =
  //   await firestore.collection(CoursesCollectionName).get();
  //
  //   return allCourses;
  // }
  Future<QuerySnapshot<Map<String, dynamic>>> getalldoc() async {
    QuerySnapshot<Map<String, dynamic>> allDoc =
        await FirebaseFirestore.instance.collection('course').get();
    return allDoc;
  }

  List<CourseModel> CoursesList = [];

  getCourses2() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await getalldoc();
    CoursesList.clear();
//for loop data from docs  and add it to the list of object
    for (var element in snapshot.docs) {
      CoursesList.add(CourseModel.fromJson(element.data()));
    }
  }
  Future<QuerySnapshot<Map<String, dynamic>>> getalldoc2() async {
    QuerySnapshot<Map<String, dynamic>> allDoc2 =
        await FirebaseFirestore.instance.collection('Our Free Courses').get();
    return allDoc2;
  }
  List<CourseModel> CoursesList2 = [];

  getCourses3() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await getalldoc2();
    CoursesList2.clear();
//for loop data from docs  and add it to the list of object
    for (var element in snapshot.docs) {
      CoursesList2.add(CourseModel.fromJson(element.data()));
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getalldoc3() async {
    QuerySnapshot<Map<String, dynamic>> allDoc3 =
    await FirebaseFirestore.instance.collection('Our Paid Courses').get();
    return allDoc3;
  }
  List<CourseModel> CoursesList3 = [];

  getCourses4() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await getalldoc3();
    CoursesList3.clear();
//for loop data from docs  and add it to the list of object
    for (var element in snapshot.docs) {
      CoursesList3.add(CourseModel.fromJson(element.data()));
    }
  }

  getAllCourses() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await getalldocCourse();
    CoursesAllList.clear();
//for loop data from docs  and add it to the list of object
    for (var element in snapshot.docs) {
      CoursesAllList.add(CourseModel.fromJson(element.data()));
    }
  }
  Future<QuerySnapshot<Map<String, dynamic>>> getalldocCourse() async {
    QuerySnapshot<Map<String, dynamic>> allDoc2 =
    await FirebaseFirestore.instance.collection('All Courses').get();
    return allDoc2;
  }
  List<CourseModel> CoursesAllList = [];




//   getCourses3() async {
//     QuerySnapshot<Map<String, dynamic>> snapshot =
//     await getalldoc();
//     CoursesList.clear();
// //for loop data from docs  and add it to the list of object
//     for (var element in snapshot.docs) {
//       CoursesList.add(CourseModel.fromJson(element.data()));
//     }
//   }
}

//   Future QuerySnapshot<Map<String,dynamic>> getCoursesData()async {
//     // CourseModel? courseModel;
//     // emit(GetCourseLoadingState());
//
//     return await FirebaseFirestore.instance.collection('course').get();
//
//     //     .then((value) {
//     //   // courseModel = CourseModel.fromJson(value.);
//     //   emit(GetCourseSuccessState());
//     // }).catchError((error) {
//     //   print(error.toString());
//     //   emit(GetCourseErrorState(error.toString()));
//     // });
//   }
//
//   List<CourseModel> CoursesList = [] ;
//   Future getAllCourses ()async{
// QuerySnapshot<Map<String,dynamic>> snapshot = await  getCoursesData();
//
//   }
