import 'package:bloc/bloc.dart';
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

  void getUserData() async{
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

  void getCoursesData() {
    CourseModel? courseModel;
    emit(GetCourseLoadingState());

    FirebaseFirestore.instance.collection('course').doc('F6KUume5luEASZU9W9rT').get()

        .then((value) {
      // courseModel = CourseModel.fromJson(value.);
      emit(GetCourseSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCourseErrorState(error.toString()));
    });
  }
}
