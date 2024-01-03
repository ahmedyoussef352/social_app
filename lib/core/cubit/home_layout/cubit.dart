// ignore_for_file: prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:fashiontik/core/config/end_points.dart';
import 'package:fashiontik/core/cubit/home_layout/states.dart';
import 'package:fashiontik/data/local/cache_helper.dart';
import 'package:fashiontik/data/local/model/login_model.dart';
import 'package:fashiontik/data/local/model/register_model.dart';
import 'package:fashiontik/data/local/model/user_model.dart';
import 'package:fashiontik/data/local/remote/dio.dart';
import 'package:fashiontik/view/componants/components.dart';
import 'package:fashiontik/view/screens/auth/login/login_screen.dart';
import 'package:fashiontik/view/screens/home_layout/chats/chats_screen.dart';
import 'package:fashiontik/view/screens/home_layout/feeds/feeds_screen.dart';
import 'package:fashiontik/view/screens/home_layout/home_screen.dart';
import 'package:fashiontik/view/screens/home_layout/new_post/post_screen.dart';
import 'package:fashiontik/view/screens/home_layout/settings/setting_screen.dart';
import 'package:fashiontik/view/screens/home_layout/users/users_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(
    context,
  ) =>
      BlocProvider.of(context);
  int currentIndex = 2;
  List<Widget> screens = [
    const FeedsScreen(),
    ChatsSreens(),
    NewPostScreen(),
    const UsersScreen(),
    const SettingsScreen(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'post',
    'Users',
    'Settings',
  ];

  ///changeBottomNavigation
  void changeBottomIndex(int index) {
    if (index == 2) {
      emit(SocialChangePostStates());
    } else {
      currentIndex = index;
      emit(SocialChangeButtomStates());
    }
  }

  bool isDark = false;
////change Mode
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(SocialChangeModeStates());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(SocialChangeModeStates());
      });
    }
  }

  RegistrationModel? registrationModel;

  void registration(
    context, {
    required TextEditingController username,
    required TextEditingController password,
    required TextEditingController confirmPassword,
    required TextEditingController email,
    required TextEditingController phone,
  }) async {
    emit(OnLoadingRegistration());
    DioHelper.postData(url: EndPoint.registration, data: {
      "username": username.text,
      "phone": phone.text,
      "password": password.text,
      "email": email.text
    }).then((value) {
      registrationModel = RegistrationModel.fromJson(value.data);
      print('00000000000000000000000000000000000');
      print("registToken is $value");
      print('00000000000000000000000000000000000');

      emit(RegistrationSuccessful());
      navigatTo(context, LoginScreen());
    }).catchError((error) {
      print("error$error");
      emit(RegistrationError(
          //error
          ));
      showToast(text: error, state: ToastStates.ERROR);
    });
  }
  // showToast(text: "please enter same Password", state: ToastStates.ERROR);

  LoginModel? loginModel;
  void login(
    context, {
    required TextEditingController email,
    required TextEditingController password,
  }) async {
    // var formdata = formstate.currentState;

    // if (formdata!.validate()) {
    emit(OnLoadingLogin());

    DioHelper.postData(
        url: EndPoint.login,
        data: {"email": email.text, "password": password.text}).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      EndPoint.loginToken = loginModel!.accessToken!;
      print('00000000000000000000000000000000000');
      print("loginToken is ${EndPoint.loginToken}");

      emit(LoginSuccessful());
      navigatTo(context, SocialHome());
    }).catchError((error) {
      print(error);
      emit(LoginError());
      showToast(text: error, state: ToastStates.ERROR);
    });
  }

  // UserModel? userModel;
  // Future<void> getUserData() async {
  //   emit(OnLoadingAllUsers());
  //   await DioHelper.getData(
  //     url: EndPoint.getAllUsers,
  //     query:
  //     // token:
  //     //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2Nsb3RoaW5nYXBwLmZhc2hpb25tYXIuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzA0MjEyNzAwLCJleHAiOjE3MDQyMTYzMDAsIm5iZiI6MTcwNDIxMjcwMCwianRpIjoiRnBjdXE5amptdU5OTWVycCIsInN1YiI6IjgiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.AHUJyqTT5ZzuYotRxjeXgc9gnHYAVeCib0UWR1UxHE4",
  //   ).then((value) {
  //     userModel = UserModel.fromJson(value!.data);
  //     print('00000000000000000000000000000000000');
  //     print(value);
  //     print('00000000000000000000000000000000000');

  //     emit(GetAllUsersSuccessful());
  //   }).catchError((error) {
  //     print(error);
  //     emit(GetAllUsersError());
  //   });
  UserModel? userModel;
  // List<UserModel> users = [];
  Future<void> getAllUsers() async {
    emit(OnLoadingAllUsers());
    print(
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2Nsb3RoaW5nYXBwLmZhc2hpb25tYXIuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzA0MzA2MTA4LCJleHAiOjE3MDQzMDk3MDgsIm5iZiI6MTcwNDMwNjEwOCwianRpIjoiTE9KNVBXZUp2enJXS3p2SCIsInN1YiI6IjgiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.VLxFTBgajWP730oGd05Zxd2Pk5h25xLqwkaGHbPW7gM");
    await DioHelper.getdata(
            url: EndPoint.getAllUsers, token: EndPoint.loginToken)
        .then((value) {
      userModel = UserModel.fromJson(value.data);
      print(value);
      emit(GetAllUsersSuccessful());
      // print("get 0000000000000000000");
      // print(value);
      // print("get 000000000000000000");
    }).catchError((error) {
      print('ERROR');
      print(error.toString());
      emit(GetAllUsersError(
          //error
          ));
    });
  }

  // int currentIndex = 0;
  // bool isloading = false;

  // List screens = [
  //   HomeScreen(),
  //   PostsScreen(),
  //   Notifications(),
  // ];
  // void changeIndex(index, context) {
  //   currentIndex = index;
  //   emit(AppChangeBottomNavBarState());
  // }
  // //

  // int currentIndex2 = 0;

  // List screens2 = [
  //   HomeScreen(),
  //   PostsScreen(),
  //   Notifications(),
  // ];
  // void changeIndex2(index, context) {
  //   currentIndex2 = index;
  //   emit(AppChangeBottomNavBarState());
  // }

  // getidUser({required String id}) async {
  //   var response = await postRequest(linkViewidprofile, {"id": id});
  //   return response;
  // }

  // //authuser
  // var taaaa;

  // Future? signUp(
  //   context, {
  //   required TextEditingController email,
  //   required TextEditingController username,
  //   required TextEditingController phone,
  //   required TextEditingController password,
  //   required TextEditingController confirmPassword,
  //   required GlobalKey<FormState> formstate,
  //   required bool user,
  // }) async {
  //   var formdata = formstate.currentState;
  //   if (formdata!.validate()) {
  //     if (password.text == confirmPassword.text) {
  //       isloading = true;
  //       emit(LoadingTrue());

  //       var response =
  //           await postRequest(user == true ? linkSignUp : linkSignUpDoc, {
  //         "username": username.text,
  //         "email": email.text,
  //         "phone": phone.text,
  //         "password": password.text,
  //       });
  //       isloading = false;
  //       emit(LoadingFalse());
  //       if (response["status"] == "success") {
  //         emit(SuccessSignUp());

  //         user == true
  //             ? navigatTo(context, const LoginScreen())
  //             : navigatTo(context, const LoginDoctor());
  //       } else {
  //         print('signUp fail');
  //       }
  //     } else {
  //       return Fluttertoast.showToast(
  //           msg: "Your Passwordrs aren't identical",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.grey[600],
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //     }
  //   }
  // }

  // getidDoc({required String id}) async {
  //   var response = await postRequest(linkViewIdDoc, {"id": id});
  //   return response;
  // }

  // getNotes({
  //   required String category,
  // }) async {
  //   var response = await postRequest(linkView, {"category": category});
  //   return response;
  // }

  // var n;
}
