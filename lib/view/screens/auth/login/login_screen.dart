// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable, use_build_context_synchronously, avoid_print, unnecessary_null_comparison

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fashiontik/core/config/app_values.dart';
import 'package:fashiontik/core/config/assets_manager.dart';
import 'package:fashiontik/core/config/colors.dart';
import 'package:fashiontik/core/config/fonts.dart';
import 'package:fashiontik/core/cubit/home_layout/cubit.dart';
import 'package:fashiontik/core/cubit/home_layout/states.dart';
import 'package:fashiontik/core/functions/invalid.dart';
import 'package:fashiontik/data/local/cache_helper.dart';
import 'package:fashiontik/view/componants/components.dart';
import 'package:fashiontik/view/screens/home_layout/home_screen.dart';
import 'package:fashiontik/view/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../sign_up/sign_up_screen.dart';
import '../../../../../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
        if (AppCubit.get(context).loginModel != null) {
          if (state is LoginSuccessful) {
            showToast(text: "Sign in Successfully", state: ToastStates.SUCCESS);
            CacheHelper.SaveData(
                key: "username",
                value: AppCubit.get(context).loginModel?.user?.username);
            CacheHelper.SaveData(
                key: "phone",
                value: AppCubit.get(context).loginModel?.user?.phone);
            CacheHelper.SaveData(
                key: "email",
                value: AppCubit.get(context).loginModel?.user?.email);
            CacheHelper.SaveData(
                key: "userId",
                value: AppCubit.get(context).loginModel?.user?.id);
            CacheHelper.SaveData(
                    key: "token",
                    value: AppCubit.get(context).loginModel?.accessToken)
                .then((value) {
              navigateToFinish(context: context, widget: const SocialHome());
            });
          }
        } else if (state is LoginError) {
          print("error");
          showToast(
              text: 'Error ... please Enter your information again !',
              state: ToastStates.ERROR);
          navigateTo(context, const LoginScreen());
        }
      }, builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          // appBar: AppBar(),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsManager.signPhoto),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: AppSize.h60.h,
                left: AppSize.w30.w,
                right: AppSize.w30.w,
              ),
              child: Container(
                child: Form(
                  key: formstate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppSize.h50.h,
                      ),
                      Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: AppFontsSizeManager.s45_3.sp,
                            fontWeight: AppFontsWeightManager.bold),
                      ),
                      SizedBox(
                        height: AppSize.h5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: AppFontsSizeManager.s22.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: AppSize.w10.w,
                          ),
                          InkWell(
                            onTap: () {
                              navigatTo(context, const SignUpScreen());
                            },
                            child: Text("Sign Up!",
                                style: TextStyle(
                                    color: AppColors.blue,
                                    fontSize: AppFontsSizeManager.s22.sp,
                                    fontWeight: AppFontsWeightManager.bold600)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppSize.h50.h,
                      ),
                      lable(label: 'Email', fontWeight: FontWeight.w600),
                      SizedBox(
                        height: AppSize.h10.h,
                      ),

                      defaultFormFieldAuth(
                        controller: email,
                        type: TextInputType.emailAddress,
                        validate: (val) {
                          return validInput(val!, 8, 22);
                        },
                        text: 'Email Address',
                        // ),
                      ),
                      SizedBox(
                        height: AppSize.h25.h,
                      ),
                      lable(label: 'Password', fontWeight: FontWeight.w600),
                      SizedBox(
                        height: AppSize.h10.h,
                      ),
                      defaultFormFieldAuth(
                        controller: password,
                        type: TextInputType.visiblePassword,
                        isPassword: true,
                        validate: (val) {
                          return validInput(val!, 8, 16);
                        },
                        text: 'Password',
                      ),
                      // ),
                      const Spacer(),
                      ConditionalBuilder(
                        condition: state is! OnLoadingLogin,
                        builder: (context) => defaultButton(
                          onpressed: () {
                            if (formstate.currentState!.validate()) {
                              cubit.login(
                                context,
                                email: email,
                                password: password,
                              );
                            }
                          },
                          text: 'Sign In',
                          radius: 18.0,
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),

                      SizedBox(
                        height: AppSize.h100.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
