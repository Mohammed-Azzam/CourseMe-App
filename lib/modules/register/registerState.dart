
import 'package:firebase_auth/firebase_auth.dart';

abstract class CourseRegisterStates{}
class RegisterInitialState extends CourseRegisterStates{}

class ChangeRegisterPasswordState extends CourseRegisterStates {}

class LoadingRegisterState extends CourseRegisterStates {}

class RegisterErrorState extends CourseRegisterStates{
  final String error;
  RegisterErrorState(this.error);
}
class ErrorCreateRegister extends CourseRegisterStates {}

class ErrorRegister extends CourseRegisterStates {
  final String error;
  ErrorRegister(this.error);
}

class RegisterPasswordShowState extends CourseRegisterStates{}

class RegisterSuccessState extends CourseRegisterStates {}
class SuccessCreateRegister extends CourseRegisterStates {
  final String uId;
  SuccessCreateRegister(this.uId);
}
