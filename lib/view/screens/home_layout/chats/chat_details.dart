// // ignore_for_file: prefer_is_empty, must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ChatDetailsSreens extends StatelessWidget {
//   // SocialUserModel userModel;
//   ChatDetailsSreens({
//     super.key,
//     // required this.userModel,
//   });
//   TextEditingController text = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // return Builder(
//     //   builder: (context) {
//     //     SocialCubit.get(context)
//     //         .getMessages(receiverId: userModel.uId.toString());
//     //     return BlocConsumer<SocialCubit, SocialStates>(
//     //       listener: (context, state) {},
//     //       builder: (context, state) {
//     //         DateTime now = DateTime.now();
//     //         int hours = now.hour;
//     //         int minutes = now.minute;
//     //         var cubit = SocialCubit.get(context);
//             return Scaffold(
//                 appBar: AppBar(
//                     titleSpacing: 0.0,
//                     title: Row(children: [
//                       CircleAvatar(
//                         radius: 20.0,
//                         backgroundImage:
//                             NetworkImage(userModel.image.toString()),
//                       ),
//                       const SizedBox(width: 15),
//                       Text(userModel.name.toString())
//                     ])),
//                 body: ConditionalBuilder(
//                   builder: (context) => Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       children: [
//                         ListView.separated(
//                             shrinkWrap: true,
//                             physics: NeverScrollableScrollPhysics(),
//                             itemBuilder: ((context, index) {
//                               var message = cubit.messages[index];
//                               if (cubit.userModel!.uId == message.senderId) {
//                                 return buildMyMessages(message);
//                               } else {
//                                 return buildMessages(message);
//                               }
//                             }),
//                             separatorBuilder: ((context, index) {
//                               return const SizedBox(height: 15.0);
//                             }),
//                             itemCount: cubit.messages.length),
//                         Spacer(),
//                         Expanded(
//                           child: Container(
//                             clipBehavior: Clip.antiAliasWithSaveLayer,
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: Colors.grey.shade300,
//                                   width: 1,
//                                 ),
//                                 borderRadius: BorderRadius.circular(15.0)),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                     child: TextFormField(
//                                   controller: text,
//                                   decoration: const InputDecoration(
//                                       border: InputBorder.none,
//                                       hintText: 'type your message here ...'),
//                                 )),
//                                 Container(
//                                   height: 40.0,
//                                   color: Colors.blue,
//                                   child: MaterialButton(
//                                     onPressed: () {
//                                       cubit.sendMessages(
//                                           receiverId: userModel.uId.toString(),
//                                           dateTime: '$hours:$minutes',
//                                           text: text.text);
//                                     },
//                                     minWidth: 1.0,
//                                     child: const Icon(Icons.send,
//                                         size: 16, color: Colors.white),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   condition: cubit.messages.length > 0,
//                   fallback: (context) =>
//                       const Center(child: CircularProgressIndicator()),
//                 ));
//           },
//         );
//       },
//     );
//   }
// }

// //buildMessages
// ////receiver message
// Widget buildMessages(
//   MessageModel model,
// ) {
//   return Align(
//     alignment: AlignmentDirectional.centerStart,
//     child: Container(
//       decoration: BoxDecoration(
//           color: Colors.grey[300],
//           borderRadius: const BorderRadiusDirectional.only(
//             bottomEnd: Radius.circular(10.0),
//             topEnd: Radius.circular(10.0),
//             topStart: Radius.circular(10.0),
//           )),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
//         child: Text(model.text.toString()),
//       ),
//     ),
//   );
// }

// ///sender messages
// Widget buildMyMessages(
//   MessageModel model,
// ) {
//   return Align(
//     alignment: AlignmentDirectional.centerEnd,
//     child: Container(
//       decoration: BoxDecoration(
//           color: Colors.blue.withOpacity(.2),
//           borderRadius: const BorderRadiusDirectional.only(
//             bottomStart: Radius.circular(10.0),
//             topEnd: Radius.circular(10.0),
//             topStart: Radius.circular(10.0),
//           )),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
//         child: Text(model.text.toString()),
//       ),
//     ),
//   );
// }
