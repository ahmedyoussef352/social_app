// ignore_for_file: unnecessary_null_comparison, unused_local_variable, sized_box_for_whitespace

import 'package:fashiontik/core/config/app_values.dart';
import 'package:fashiontik/core/cubit/home_layout/cubit.dart';
import 'package:fashiontik/core/cubit/home_layout/states.dart';
import 'package:fashiontik/view/componants/components.dart';
import 'package:fashiontik/view/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController bioController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
      appBar: defaultAppBar(actions: [
        defaultTextButton(
            function: () {
              // cubit.uploadProfileImage();
              // cubit.updateUser(
              //     name: nameController.text,
              //     phone: phoneController.text,
              //     bio: bioController.text,
              //     cover: cubit.coverImage!.path);
            },
            text: 'Update'),
        SizedBox(
          width: AppSize.w15.w,
        )
      ], context: context, title: 'Edit Profile'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: AppSize.h140.h,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: AppRadius.r100.r,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: CircleAvatar(
                      radius: AppRadius.r200.r,
                      child: Container(
                        width: AppSize.w160.w,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppRadius.r100.r),
                            image:
                                // cubit.profileImage == null
                                //     ? DecorationImage(
                                //         image: NetworkImage(userModel
                                //             .image
                                //             .toString()),
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
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        // cubit.getProfileImage();
                      },
                      icon: CircleAvatar(
                          radius: AppSize.h20.h,
                          child: Icon(Icons.camera_alt_outlined)))
                ],
              ),
            ),
            SizedBox(
              height: AppSize.h20.h,
            ),

            /// edit text
            ///

            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
              child: Column(
                children: [
                  defaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      titlevalidate: 'please enter your name',
                      label: "name",
                      isClickable: false,
                      prefix: Icons.person_2_outlined),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultFormField(
                      controller: bioController,
                      type: TextInputType.text,
                      titlevalidate: 'please enter your bio',
                      label: "Bio",
                      prefix: Icons.info_outline_rounded),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      titlevalidate: 'please enter your phone number',
                      label: "Phone",
                      prefix: Icons.phone),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key});

//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController bioController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     // return BlocConsumer<AppCubit, AppStates>(
//     //     listener: (context, state) {},
//     //     builder: (context, state) {
//     // var userModel = AppCubit.get(context).userModel!;
//     // nameController.text = userModel.name!;
//     // bioController.text = userModel.bio!;
//     // phoneController.text = userModel.phone!;
//     // var cubit = SocialCubit.get(context);
//     // var profileImage = SocialCubit.get(context).profileImage!;
//     // var coverImage = SocialCubit.get(context).coverImage!;
//     return Scaffold(
//         appBar: AppBar(),
//         // defaultAppBar(actions: [
//         //   defaultTextButton(
//         //       function: () {
//         //         // cubit.uploadProfileImage();
//         //         // cubit.updateUser(
//         //         //     name: nameController.text,
//         //         //     phone: phoneController.text,
//         //         //     bio: bioController.text,
//         //         //     cover: cubit.coverImage!.path);
//         //       },
//         //       text: 'Update'),
//         //   SizedBox(
//         //     width: AppSize.w15.w,
//         //   )
//         // ], context: context, title: 'Edit Profile'),
//         body: Padding(
//           padding: EdgeInsets.only(top: AppPadding.p50.h),
//           child: Column(
//             children: [
//               // if (state is SocialUserUpdateLoadingStates)
//               //   const LinearProgressIndicator(),
//               // if (state is SocialUserUpdateLoadingStates)
//               SizedBox(
//                 height: AppSize.h10.h,
//               ),
//               //edit images
//               Container(
//                 alignment: Alignment.center,
//                 height: AppSize.h140.h,
//                 child: Stack(
//                   alignment: AlignmentDirectional.bottomEnd,
//                   children: [
//                     CircleAvatar(
//                       radius: AppRadius.r100.r,
//                       backgroundColor:
//                           Theme.of(context).scaffoldBackgroundColor,
//                       child: CircleAvatar(
//                         radius: AppRadius.r200.r,
//                         child: Container(
//                           width: AppSize.w160.w,
//                           decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.circular(AppRadius.r100.r),
//                               image:
//                                   // cubit.profileImage == null
//                                   //     ? DecorationImage(
//                                   //         image: NetworkImage(userModel
//                                   //             .image
//                                   //             .toString()),
//                                   //         fit: BoxFit.cover)
//                                   //     :
//                                   const DecorationImage(
//                                       image: NetworkImage(
//                                         'https://img.freepik.com/free-photo/satisfied-bearded-male-youngster-listens-merry-song-headphones-moves-pink-background-boosts-mood-with-cool-music-feels-upbeat-wears-red-hat-black-t-shirt_273609-34632.jpg',
//                                         // FileImage(
//                                         //     cubit.profileImage!),
//                                       ),
//                                       fit: BoxFit.cover)),
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                         onPressed: () {
//                           // cubit.getProfileImage();
//                         },
//                         icon: CircleAvatar(
//                             radius: AppSize.h20.h,
//                             child: Icon(Icons.camera_alt_outlined)))
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: AppSize.h10.h,
//               ),
//               Text('sdjfhjskdf'),
//               // if (cubit.profileImage != null && cubit.coverImage != null)
//               Row(
//                 children: [
//                   // if (cubit.profileImage != null)
//                   Column(
//                     children: [
//                       defaultButton(
//                           // function: () {
//                           //   cubit.uploadProfileImage(
//                           //       name: nameController.text,
//                           //       phone: phoneController.text,
//                           //       bio: bioController.text);
//                           // },
//                           text: 'upload profile image',
//                           onpressed: () {}),
//                       // if (state is SocialUserUpdateLoadingStates)
//                       // const SizedBox(
//                       //   height: 5.0,
//                       // ),
//                       // const LinearProgressIndicator(),
//                     ],
//                   ),
//                   const SizedBox(
//                     width: 5.0,
//                   ),
//                   // if (cubit.profileImage != null)
//                   defaultButton(
//                       onpressed: () {},
//                       // function: () {
//                       //   cubit.uploadCoverImage(
//                       //       name: nameController.text,
//                       //       phone: phoneController.text,
//                       //       bio: bioController.text);
//                       // },
//                       text: 'upload cover image'),
//                   // if (state is SocialUserUpdateLoadingStates)
//                   // const SizedBox(
//                   //   height: 5.0,
//                   // ),
//                   // const LinearProgressIndicator(),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),

//               /// edit text
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Column(
//                   children: [
//                     defaultFormField(
//                         controller: nameController,
//                         type: TextInputType.name,
//                         titlevalidate: 'please enter your name',
//                         label: "name",
//                         isClickable: false,
//                         prefix: Icons.person_2_outlined),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     defaultFormField(
//                         controller: bioController,
//                         type: TextInputType.text,
//                         titlevalidate: 'please enter your bio',
//                         label: "Bio",
//                         prefix: Icons.info_outline_rounded),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     defaultFormField(
//                         controller: phoneController,
//                         type: TextInputType.phone,
//                         titlevalidate: 'please enter your phone number',
//                         label: "Phone",
//                         prefix: Icons.phone),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
// //       },
//   }
//   //);
// }
// // }
// //   }
// // }
