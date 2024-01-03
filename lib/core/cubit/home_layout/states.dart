abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomNavBarState extends AppStates {}

class SocialGetUserErrorState extends AppStates {
  final String error;

  SocialGetUserErrorState(this.error);
}

///registration
class OnLoadingRegistration extends AppStates {}

class RegistrationSuccessful extends AppStates {}

class RegistrationError extends AppStates {
  // final String error;
  // RegistrationError(this.error);
}

///login

class OnLoadingLogin extends AppStates {}

class LoginSuccessful extends AppStates {}

class LoginError extends AppStates {
  // final String error;
  // LoginError(this.error);
}

///get all users
class OnLoadingAllUsers extends AppStates {}

class GetAllUsersSuccessful extends AppStates {}

class GetAllUsersError extends AppStates {
  // final String error;
  // LoginError(this.error);
}

//ChangeButtomNavigation
class SocialChangeButtomStates extends AppStates {}

class SocialChangePostStates extends AppStates {}

//mode
class SocialChangeModeStates extends AppStates {}

///craete post
class SocialCreatePostLoadingStates extends AppStates {}

class SocialCreatePostSuccessStates extends AppStates {}

class SocialCreatePostErrorStates extends AppStates {
  final String error;
  SocialCreatePostErrorStates(this.error);
}



// class LoadingTrue extends AppStates {}

// class LoadingFalse extends AppStates {}
// //auth

// class SuccessLogin extends AppStates {}

// class SuccessSignUp extends AppStates {}
// class AddFileError extends AppStates {
//     final String message;

//   AddFileError(this.message);
// }
// //info Doctor

// class AddInfoSuccess extends AppStates {}
// class AddInfoError extends AppStates {
//     final String message;

//   AddInfoError(this.message);
// }
// //apointment
// class AddapointmentSuccess extends AppStates {}
// class AddapointmentFailed extends AppStates {}
// //edit appointment

// class EditapointmentSuccess extends AppStates {}
// class EditapointmentFailed extends AppStates {}

// //profile
// class AddProfileSuccess extends AppStates {}
// class AddProfileError extends AppStates {
//     final String message;

//   AddProfileError(this.message);
// }
// ///post
// class AddPostSuccess extends AppStates {}
// class AddPostError extends AppStates {
//     final String message;

//   AddPostError(this.message);
// }
// class EditPostSuccess extends AppStates {}
// class EditPostFailed extends AppStates {}
// ///comment
// class AddCommentSuccess extends AppStates {}
// class AddCommentError extends AppStates {}
// ///chat
// class AddChatSuccess extends AppStates {}
// class AddChatError extends AppStates {}
