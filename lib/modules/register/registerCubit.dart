import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/modules/register/registerState.dart';

import '../../models/user_model.dart';
import '../../shared/helper/dio_helper.dart';

class RegisterCubit extends Cubit<CourseRegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(LoadingRegisterState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      UserCreate(email: email, name: name, phone: phone, uId: value.user!.uid);
    }).catchError((error)
    {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  void UserCreate({
    required String email,
    required String name,
    required String phone,
    required String uId,
  }) {
    UserModel createUserModel = UserModel(
        uId: uId,
        name: name,
        email: email,
        phone: phone,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(createUserModel.toMap())
        .then((value) {

      emit(SuccessCreateRegister(uId));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorRegister(error.toString()));
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void passwordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(RegisterPasswordShowState());
  }
}
