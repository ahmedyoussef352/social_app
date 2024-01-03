// ignore_for_file: deprecated_member_use, sized_box_for_whitespace, avoid_print

import 'package:fashiontik/core/config/app_values.dart';
import 'package:fashiontik/core/config/colors.dart';
import 'package:fashiontik/core/config/fonts.dart';
import 'package:fashiontik/core/cubit/home_layout/cubit.dart';
import 'package:fashiontik/core/cubit/home_layout/states.dart';
import 'package:fashiontik/view/componants/components.dart';
import 'package:fashiontik/view/screens/home_layout/users/edit_profile.dart/edit_profile_screen.dart';
import 'package:fashiontik/view/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    initState() {
      // SocialCubit.get(context).getUserData();
      // print('++++++++++++++++++++++++++++++++');
      // print(SocialCubit.get(context).model?.name);
      // print('++++++++++++++++++++++++++++++++');
    }

    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // var userModel = SocialCubit.get(context).userModel!;

          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: AppSize.h50.h,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                  radius: AppSize.h60.h,
                                  backgroundImage: const NetworkImage(
                                      'https://img.freepik.com/free-photo/satisfied-bearded-male-youngster-listens-merry-song-headphones-moves-pink-background-boosts-mood-with-cool-music-feels-upbeat-wears-red-hat-black-t-shirt_273609-34632.jpg')
                                  //userModel.image.toString()),
                                  ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    //vertical: AppPadding.p1.h
                                    ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(),
                                    SizedBox(),
                                    InkWell(
                                      onTap: () {},
                                      child: Column(
                                        children: [
                                          Text(
                                            'Posts',
                                            style: TextStyle(
                                                fontSize:
                                                    AppFontsSizeManager.s25.sp,
                                                fontWeight:
                                                    AppFontsWeightManager.bold),
                                          ),
                                          Text(
                                            '100',
                                            style: TextStyle(
                                              fontSize:
                                                  AppFontsSizeManager.s25.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Column(
                                        children: [
                                          Text(
                                            'Mobile Phone',
                                            style: TextStyle(
                                                fontSize:
                                                    AppFontsSizeManager.s25.sp,
                                                fontWeight:
                                                    AppFontsWeightManager.bold),
                                          ),
                                          Text(
                                            '01156565656',
                                            style: TextStyle(
                                              fontSize:
                                                  AppFontsSizeManager.s25.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox()
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSize.h5.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: AppSize.w300.w,
                              child: Text(
                                'ahmed youssef',
                                // userModel.name.toString(),,
                                style: TextStyle(
                                    fontSize: AppFontsSizeManager.s25.sp,
                                    fontWeight: AppFontsWeightManager.bold),
                              ),
                            ),
                            Container(
                              width: AppSize.w300.w,
                              child: Text(
                                'ksjdfkhlvdfjk',
                                // userModel.bio.toString(),
                                style: TextStyle(
                                    fontSize: AppFontsSizeManager.s20.sp,
                                    color: AppColors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //row

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.p20.w,
                        vertical: AppPadding.p10.h),
                    child: Row(
                      children: [
                        Expanded(
                            child: OutlinedButton(
                                onPressed: () {},
                                child: const Text('Add Post'))),
                        SizedBox(
                          width: AppSize.w20.w,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            // navigateTo(context, widget)
                            navigateTo(context, const EditProfileScreen());
                          },
                          child: const Icon(
                            Icons.drive_file_rename_outline_outlined,
                            size: 16,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
