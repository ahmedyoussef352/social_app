// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_details.dart';

class ChatsSreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
    // return BlocConsumer<SocialCubit, SocialStates>(
    //     listener: (context, state) {},
    //     builder: (context, state) {
    //       var cubit = SocialCubit.get(context);
    //       return Scaffold(
    //           // appBar: AppBar(
    //           //   title: const Text('Chat Sreens'),
    //           // ),
    //           body: ConditionalBuilder(
    //         condition: cubit.users.length > 0,
    //         builder: (context) => ListView.separated(
    //             physics: const BouncingScrollPhysics(),
    //             itemBuilder: (context, index) => buildChatItem(
    //                 cubit.users[index] as SocialUserModel, context),
    //             separatorBuilder: (context, index) => myDivider(),
    //             itemCount: cubit.users.length),
    //         fallback: (context) =>
    //             const Center(child: CircularProgressIndicator()),
    //       ));
    //     });
  }

  // Widget buildChatItem(SocialUserModel model, context) => InkWell(
  //       onTap: () {
  //         navigateTo(
  //             context,
  //             ChatDetailsSreens(
  //               userModel: model,
  //             ));
  //       },
  //       child: Padding(
  //         padding: const EdgeInsets.all(20.0),
  //         child: Row(
  //           children: [
  //             CircleAvatar(
  //               radius: 25.0,
  //               backgroundImage: NetworkImage(model.image.toString()),
  //             ),
  //             const SizedBox(width: 15.0),
  //             Text(
  //               model.name.toString(),
  //               style: const TextStyle(height: 1.4),
  //             )
  //           ],
  //         ),
  //       ),
  //     );
}
