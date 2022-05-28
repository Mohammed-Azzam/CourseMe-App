abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class GetCourseLoadingState extends HomeStates {}

class GetCourseSuccessState extends HomeStates {}

class GetCourseErrorState extends HomeStates {
   String error;
   GetCourseErrorState(this.error);
}
class GetCourseImageLoadingState extends HomeStates {}

class GetCourseImageSuccessState extends HomeStates {}

class GetCourseImageErrorState extends HomeStates {
   String error;
   GetCourseImageErrorState(this.error);
}

class ProfileImagePickedSuccessState extends HomeStates {}

class ProfileImagePickedErrorState extends HomeStates {}

class CoverImagePickedSuccessState extends HomeStates {}

class CoverImagePickedErrorState extends HomeStates {}

class UploadProfileImagePickedSuccessState extends HomeStates {}

class UploadProfileImagePickedErrorState extends HomeStates {}

class UploadCoverImagePickedSuccessState extends HomeStates {}

class UploadCoverImagePickedErrorState extends HomeStates {}

class UpdateErrorState extends HomeStates {}

class UpdateSuccessState extends HomeStates {}

class UpdateLoadingState extends HomeStates {}

class UpdateProfileLoadingState extends HomeStates {}

class UpdateCoverLoadingState extends HomeStates {}
// create post

class ChangeThemeState extends HomeStates {}
