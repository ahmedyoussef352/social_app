// ignore_for_file: avoid_unnecessary_containers, must_be_immutable, use_build_context_synchronously, avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fashiontik/core/config/app_values.dart';
import 'package:fashiontik/core/config/assets_manager.dart';
import 'package:fashiontik/core/config/colors.dart';
import 'package:fashiontik/core/config/fonts.dart';
import 'package:fashiontik/view/componants/components.dart';
import 'package:fashiontik/view/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/cubit/home_layout/cubit.dart';
import '../../../../../core/cubit/home_layout/states.dart';
import '../../../../../core/functions/invalid.dart';
import '../login/login_screen.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController username = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
        if (state is RegistrationError) {
          print("error");
          showToast(
              text: "change your email address", state: ToastStates.ERROR);
          navigateTo(context, const SignUpScreen());
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: AppSize.h60.h,
                      left: AppSize.w30.w,
                      right: AppSize.w30.w,
                    ),
                    child: Form(
                      key: formstate,
                      child: SingleChildScrollView(
                        child: Container(
                          height: size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: AppSize.h50.h,
                              ),
                              Text(
                                'Create Account',
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
                                    'Already have an account?',
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
                                      navigatTo(context, const LoginScreen());
                                    },
                                    child: Text("Sign In!",
                                        style: TextStyle(
                                            color: AppColors.blue,
                                            fontSize:
                                                AppFontsSizeManager.s22.sp,
                                            fontWeight:
                                                AppFontsWeightManager.bold600)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: AppSize.h50.h,
                              ),

                              lable(
                                  label: 'Username',
                                  fontWeight: FontWeight.w600),
                              SizedBox(
                                height: AppSize.h10.h,
                              ),
                              defaultFormFieldAuth(
                                controller: username,
                                type: TextInputType.emailAddress,
                                validate: (val) {
                                  return validInput(val!, 6, 15);
                                },
                                text: 'please enter your Username !',
                              ),
                              //),
                              SizedBox(
                                height: AppSize.h25.h,
                              ),
                              lable(
                                  label: 'Email', fontWeight: FontWeight.w600),
                              SizedBox(
                                height: AppSize.h10.h,
                              ),
                              defaultFormFieldAuth(
                                controller: email,
                                type: TextInputType.emailAddress,
                                validate: (val) {
                                  return validInput(val!, 8, 22);
                                },
                                text: 'please enter your Email !',
                              ),
                              // ),
                              SizedBox(
                                height: AppSize.h25.h,
                              ),
                              lable(
                                  label: 'Phone', fontWeight: FontWeight.w600),
                              SizedBox(
                                height: AppSize.h10.h,
                              ),
                              defaultFormFieldAuth(
                                controller: phone,
                                type: TextInputType.number,
                                validate: (val) {
                                  return validInput(
                                    val!,
                                    11,
                                    11,
                                  );
                                },
                                text: 'please enter your Phone !',
                              ),
                              //),
                              SizedBox(
                                height: AppSize.h25.h,
                              ),
                              lable(
                                  label: 'Password',
                                  fontWeight: FontWeight.w600),
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
                                text: 'please enter your Password !',
                              ),
                              //),
                              SizedBox(
                                height: AppSize.h25.h,
                              ),
                              lable(
                                  label: 'Confirm password',
                                  fontWeight: FontWeight.w600),
                              SizedBox(
                                height: AppSize.h10.h,
                              ),
                              defaultFormFieldAuth(
                                controller: confirmPassword,
                                type: TextInputType.visiblePassword,
                                isPassword: true,
                                validate: (val) {
                                  return validInput(val!, 8, 16);
                                },
                                text: 'please enter your Password again !',
                              ),
                              // ),
                              const Spacer(
                                flex: 2,
                              ),

                              ConditionalBuilder(
                                condition: state is! OnLoadingRegistration,
                                builder: (context) => defaultButton(
                                  onpressed: () {
                                    if (formstate.currentState!.validate()) {
                                      cubit.registration(
                                        context,
                                        email: email,
                                        username: username,
                                        phone: phone,
                                        password: password,
                                        confirmPassword: confirmPassword,
                                      );
                                    }
                                  },
                                  text: 'Sign Up',
                                  radius: AppRadius.r20.r,
                                ),
                                fallback: (context) => const Center(
                                    child: CircularProgressIndicator()),
                              ),
                              const Spacer(
                                flex: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )));
      }),
    );
  }
}
