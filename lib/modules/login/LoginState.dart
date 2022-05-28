import '../../models/user_model.dart';

abstract class LoginStates{}
class InitialState extends LoginStates{}

class LoginSuccessState extends LoginStates{
  final String uId;
  LoginSuccessState(this.uId);
}

class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState(this.error);
}

class LoginLoadingState extends LoginStates{}

class PasswordShowState extends LoginStates{}
