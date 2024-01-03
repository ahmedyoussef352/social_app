// ignore_for_file: must_be_immutable

import 'package:fashiontik/core/config/app_values.dart';
import 'package:fashiontik/core/config/fonts.dart';
import 'package:fashiontik/view/componants/components.dart';
import 'package:fashiontik/view/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({super.key});
  TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var cubit = SocialCubit.get(context);
    // return BlocConsumer<SocialCubit, SocialStates>(
    //   listener: (context, state) {},
    //   builder: (context, state) {
    //     var userModel = SocialCubit.get(context).userModel!;
    return Scaffold(
      appBar: defaultAppBar(context: context, title: 'Create Post', actions: [
        defaultTextButton(
            function: () {
              // DateTime now = DateTime.now();
              // int hours = now.hour;
              // int minutes = now.minute;
              // if (cubit.postImage == null) {
              //   cubit.createNewPost(
              //       dateTime: '$hours:$minutes', text: text.text);
              // } else {
              //   cubit.uploadPostImage(
              //       text: text.text, dateTime: now.toString());
              // }
            },
            text: 'Post'),
      ]),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p20.h),
        child: Column(
          children: [
            // if (state is SocialCreatePostLoadingStates)
            //   const LinearProgressIndicator(),
            // if (state is SocialCreatePostLoadingStates)
            //   const LinearProgressIndicator(),

            Row(
              children: [
                CircleAvatar(
                    radius: AppRadius.r35.r,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-photo/satisfied-bearded-male-youngster-listens-merry-song-headphones-moves-pink-background-boosts-mood-with-cool-music-feels-upbeat-wears-red-hat-black-t-shirt_273609-34632.jpg")
                    //userModel.image.toString()),
                    ),
                SizedBox(
                  width: AppSize.w20.w,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'ahmed youssef',
                          //  userModel.name.toString(),
                          style: TextStyle(
                              fontSize: AppFontsSizeManager.s22.sp,
                              fontWeight: AppFontsWeightManager.bold600),
                        ),
                        SizedBox(
                          width: AppSize.w5.w,
                        ),
                        // Icon(
                        //   Icons.check_circle,
                        //   color: Colors.blue,
                        //   size: 16.0,
                        // )
                      ],
                    ),
                    // Text('january 21, 2021 at 11:00 pm',
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .caption!
                    //         .copyWith(height: 1.4))
                  ],
                )),
                // const SizedBox(
                //   width: 20.0,
                // ),
                // IconButton(
                //     onPressed: () {},
                //     icon: const Icon(
                //       Icons.more_horiz,
                //       size: 16.0,
                //     ))
              ],
            ),
            TextFormField(
              controller: text,
              decoration: const InputDecoration(
                  hintText: 'what is on your mind ...',
                  border: InputBorder.none),
            ),
            SizedBox(
              height: AppSize.h20.h,
            ),
            //  if (cubit.postImage != null)
            Stack(alignment: AlignmentDirectional.topEnd, children: [
              ///cover
              Container(
                height: AppSize.h200.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppRadius.r4.r),
                      topLeft: Radius.circular(AppRadius.r4.r),
                    ),
                    image:
                        // cubit.coverImage == null
                        //     ? DecorationImage(
                        //         image:
                        //             NetworkImage(userModel.cover.toString()),
                        //         fit: BoxFit.cover)
                        //     :
                        const DecorationImage(
                            image: NetworkImage(
                              'https://img.freepik.com/free-photo/satisfied-bearded-male-youngster-listens-merry-song-headphones-moves-pink-background-boosts-mood-with-cool-music-feels-upbeat-wears-red-hat-black-t-shirt_273609-34632.jpg',
                              // FileImage(
                              //     cubit.profileImage!),
                            ),
                            fit: BoxFit.cover)),
              ),
              IconButton(
                  onPressed: () {
                    // cubit.remvePostImage();
                    // cubit.getCoverImage();
                  },
                  icon: CircleAvatar(
                      radius: AppRadius.r20.w, child: Icon(Icons.close)))
            ]),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        //cubit.getPostImage();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_outlined,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: AppSize.w5.w,
                          ),
                          Text(
                            'Add Photo',
                          ),
                        ],
                      )),
                ),
                // Expanded(
                //   child: TextButton(
                //     onPressed: () {},
                //     child: const Text('# tags'),
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
  //);
}
//}
