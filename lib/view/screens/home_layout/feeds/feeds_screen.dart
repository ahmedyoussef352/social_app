// ignore_for_file: deprecated_member_use, sized_box_for_whitespace, prefer_is_empty

import 'package:fashiontik/core/config/app_values.dart';
import 'package:fashiontik/core/config/colors.dart';
import 'package:fashiontik/core/config/fonts.dart';
import 'package:fashiontik/core/cubit/home_layout/cubit.dart';
import 'package:fashiontik/core/cubit/home_layout/states.dart';
import 'package:fashiontik/view/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          //     return ConditionalBuilder(
          //       condition: cubit.posts.length > 0 && cubit.userModel != null,
          //       builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  //cover image
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 10.0,
                    margin: EdgeInsets.only(
                        left: AppSize.w10.w,
                        right: AppSize.w10.w,
                        bottom: AppSize.h40.h),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Image(
                            width: double.infinity,
                            fit: BoxFit.cover,
                            height: AppSize.h240.h,
                            image: NetworkImage(
                                'https://img.freepik.com/free-photo/satisfied-bearded-male-youngster-listens-merry-song-headphones-moves-pink-background-boosts-mood-with-cool-music-feels-upbeat-wears-red-hat-black-t-shirt_273609-34632.jpg')),
                        Padding(
                          padding: EdgeInsets.all(AppPadding.p10.r),
                          child: Text('communicate with friends',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: AppFontsSizeManager.s20.sp,
                                  fontWeight: AppFontsWeightManager.bold)),
                        )
                      ],
                    ),
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildPostItem(
                            context,
                          ),
                      // cubit.posts[index], context, index),
                      separatorBuilder: (context, index) => SizedBox(
                            height: AppSize.h20.h,
                          ),
                      itemCount: 5),
                  //cubit.posts.length),
                ],
              ),
            ),
          );
        }
        //   fallback: (context) => const Center(
        //     child: CircularProgressIndicator(),
        //   ),
        // );
        );
  }
//     );
}
// }

Widget buildPostItem(
  //PostModel model,
  context,
  //index
) =>
    Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5.0,
      color: Colors.white,
      // margin: EdgeInsetsDirectional.symmetric(horizontal: AppPadding.p8.r),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: AppPadding.p10.r,
                left: AppPadding.p10.r,
                right: AppPadding.p10.r),
            child: Row(
              children: [
                CircleAvatar(
                    radius: AppRadius.r30.r,
                    backgroundImage: const NetworkImage(
                        'https://img.freepik.com/free-photo/satisfied-bearded-male-youngster-listens-merry-song-headphones-moves-pink-background-boosts-mood-with-cool-music-feels-upbeat-wears-red-hat-black-t-shirt_273609-34632.jpg')
                    //'${model.image}'),
                    ),
                SizedBox(
                  width: AppSize.w15.w,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'ahmed youssef',
                          //  model.name.toString(),
                          style: TextStyle(
                              fontSize: AppFontsSizeManager.s20.sp,
                              fontWeight: AppFontsWeightManager.bold600),
                        ),
                        SizedBox(
                          width: AppSize.w5.w,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                          size: AppSize.h20.h,
                        )
                      ],
                    ),
                    Text('12',
                        //model.dateTime.toString(),
                        style: TextStyle(
                            fontSize: AppFontsSizeManager.s16.sp,
                            color: AppColors.grey))
                  ],
                )),
                const SizedBox(
                  width: 20.0,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      size: AppSize.h20.h,
                    ))
              ],
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   height:AppSize.h1.h,
          //   color: Colors.grey[300],
          // ),

          // tags

          // if (model.imagepostImage != '')
          SizedBox(
            height: AppSize.h10.h,
          ),
          Container(
              height: AppSize.h300.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://img.freepik.com/free-photo/satisfied-bearded-male-youngster-listens-merry-song-headphones-moves-pink-background-boosts-mood-with-cool-music-feels-upbeat-wears-red-hat-black-t-shirt_273609-34632.jpg"
                        //model.imagepostImage.toString()
                        )),
              )),
          //react

          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppPadding.p5.h, horizontal: AppPadding.p10.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ahmed',

                //  model.text.toString(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: AppFontsSizeManager.s25.sp,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppPadding.p5.h,
                        horizontal: AppPadding.p10.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: AppColors.red,
                          size: AppSize.h35.h,
                        ),
                        SizedBox(
                          width: AppSize.w5.w,
                        ),
                        Text(
                          '5',
                          //   SocialCubit.get(context).likes[index].toString(),

                          style: TextStyle(
                              fontSize: AppFontsSizeManager.s20.sp,
                              fontWeight: AppFontsWeightManager.bold600),
                        ),
                        SizedBox(
                          width: AppSize.w20.w,
                        ),
                        Icon(
                          Icons.mode_comment_outlined,
                          size: AppSize.h35.h,
                        ),
                        SizedBox(
                          width: AppSize.w20.w,
                        ),
                        Icon(
                          Icons.share_outlined,
                          size: AppSize.h35.h,
                        ),
                        SizedBox(
                          width: AppSize.w5.w,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: AppPadding.p5.h),
            child: Container(
              width: double.infinity,
              height: AppSize.h1.h,
              color: AppColors.grey.shade400,
            ),
          ),
          //write acomment
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppPadding.p5.h, horizontal: AppPadding.p5.h),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: AppSize.h23.r,
                          backgroundImage: const NetworkImage(
                              'https://img.freepik.com/free-photo/satisfied-bearded-male-youngster-listens-merry-song-headphones-moves-pink-background-boosts-mood-with-cool-music-feels-upbeat-wears-red-hat-black-t-shirt_273609-34632.jpg'
                              // SocialCubit.get(context)
                              //   .userModel!
                              //   .image
                              //   .toString()
                              ),
                        ),
                        SizedBox(
                          width: AppSize.w20.w,
                        ),
                        Text('write comment ...',
                            style: TextStyle(
                                color: AppColors.grey.shade700,
                                fontSize: AppFontsSizeManager.s18.sp)),
                        SizedBox(
                          width: AppSize.w20.w,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
