// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, avoid_print, unnecessary_string_interpolations, sort_child_properties_last, duplicate_ignore, sized_box_for_whitespace

import 'package:fashiontik/core/config/app_values.dart';
import 'package:fashiontik/core/config/colors.dart';
import 'package:fashiontik/core/config/fonts.dart';
import 'package:fashiontik/view/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget formFieldApintMent({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData perfix,
  required String titlevalidate,
  VoidCallback? ontap,
  bool obscure = false,
  IconData? suffix,
  VoidCallback? suffixpress,
}) =>
    TextFormField(
      onTap: ontap,
      keyboardType: type,
      controller: controller,
      obscureText: obscure,
      onFieldSubmitted: (String value) {
        print(value);
      },
      onChanged: (String value) {
        print(value);
      },
      validator: (value) {
        if (value != null && value.isEmpty) {
          // ignore: unnecessary_brace_in_string_interps
          return '${titlevalidate}';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          perfix,
        ),
        suffix: suffix != null
            ? IconButton(
                onPressed: suffixpress,
                icon: Icon(suffix),
              )
            : null,
      ),
    );

Widget listTile(
    {required String title,
    required IconData iconData,
    required Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 80,
          decoration: BoxDecoration(
              color: Colors.blue.shade400,
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            onTap: onTap,
            leading: Icon(
              iconData,
              size: 28,
            ),
            title: Text(
              title,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    ),
  );
}

Widget defaultButton({
  double width = double.infinity,
  Color background = AppColors.decolor,
  bool isUpperCase = true,
  double radius = 10.0,
  required String text,
  required VoidCallback onpressed,
}) =>
    Container(
      width: width,
      height: AppSize.h70.h,
      // ignore: sort_child_properties_last
      child: MaterialButton(
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: AppFontsSizeManager.s25.sp),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );
// Widget myItem(context) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     // alignment: Alignment.centerLeft,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 16.0,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 25.0,
//                   vertical: 25.0,
//                 ),
//                 decoration: const BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadiusDirectional.only(
//                     bottomStart: Radius.circular(
//                       30.0,
//                     ),
//                     topEnd: Radius.circular(
//                       30.0,
//                     ),
//                     topStart: Radius.circular(
//                       30.0,
//                     ),
//                   ),
//                 ),
//                 child: Text(
//                   'Hello from other side',
//                   style: Theme.of(context).textTheme.subtitle2!.copyWith(
//                         color: Colors.white,
//                       ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 '12',
//                 style: TextStyle(
//                     fontWeight: FontWeight.w900,
//                     color: Colors.grey.shade400,
//                     fontSize: 12),
//               )
//             ],
//           ),
//         ),
//         imagechat(),
//       ],
//     ),
//   );
// }

// Widget docItem(context) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     // alignment: Alignment.centerLeft,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         imagechat(),
//         Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 16.0,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 25.0,
//                   vertical: 25.0,
//                 ),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadiusDirectional.only(
//                     bottomEnd: Radius.circular(
//                       30.0,
//                     ),
//                     topEnd: Radius.circular(
//                       30.0,
//                     ),
//                     topStart: Radius.circular(
//                       30.0,
//                     ),
//                   ),
//                 ),
//                 child: Text(
//                   'Hello from other side',
//                   style: Theme.of(context).textTheme.subtitle2!.copyWith(),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 '12',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w900,
//                   color: Colors.grey.shade400,
//                   fontSize: 12,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget imagechat() {
//   return Padding(
//     padding: const EdgeInsetsDirectional.only(
//       bottom: 5.0,
//     ),
//     child: Container(
//       width: 45,
//       height: 50,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(
//           10.0,
//         ),
//         image: const DecorationImage(
//           image: NetworkImage(
//             'https://brooklynintergroup.org/brooklyn/wp-content/uploads/2021/01/flower-729512__340-1.jpg',
//           ),
//           fit: BoxFit.cover,
//         ),
//       ),
//     ),
//   );
// }

// Widget defultButtonMyAppoint({
//   context,
//   onpressed,
//   required Color color,
//   required String text,
// }) =>
//     Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: TextButton(
//         onPressed: onpressed,
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(color: Colors.white, fontSize: 12),
//           ),
//         ),
//       ),
//     );

void navigatTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigatandFinish(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget showLoadingIndicator() {
  return const Center(
    child: CircularProgressIndicator(
      color: Colors.blue,
    ),
  );
}

Widget appBar(String txt, context) {
  return SafeArea(
    child: Container(
      height: AppSize.h60.h,
      color: Colors.white,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: AppColors.black,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Text(
                  txt,
                  style: TextStyle(
                    fontSize: AppFontsSizeManager.s22.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Container(
              width: AppSize.w50.w,
            )
          ],
        ),
      ),
    ),
  );
}

Widget title(String txt) {
  return Expanded(
    child: Text(
      txt,
      maxLines: 1,
      style: const TextStyle(
        color: Colors.grey,
      ),
    ),
  );
}

///profile
Widget lable({
  required String label,
  FontWeight? fontWeight,
}) {
  return
      // Expanded(child:
      Text(
    label,
    style: TextStyle(
      color: AppColors.grey.shade800,
      fontWeight: AppFontsWeightManager.bold,
      fontSize: AppFontsSizeManager.s22.sp,
    ),
    //),
  );
}

Widget defaultFormFieldAuth({
  TextEditingController? controller,
  TextInputType? type,
  bool isPassword = false,
  final String? Function(String?)? validate,
  String? text,
  final Function()? onTap,
  bool isClickable = true,
}) =>
    Container(
      child: TextFormField(
        maxLines: 1,
        style: TextStyle(
            color: AppColors.blue, fontWeight: AppFontsWeightManager.bold500),
        controller: controller,
        validator: validate,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onTap: onTap,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(
                color: AppColors.grey, fontSize: AppFontsSizeManager.s20.sp),
            contentPadding: EdgeInsets.symmetric(
                horizontal: AppSize.w30.w, vertical: AppSize.h20.h),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.blue,
                  width: AppSize.w5.w,
                  //style: BorderStyle.solid
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(AppRadius.r15.r)))),
      ),
    );

Widget myDivider() => Container(
      width: double.infinity,
      height: AppSize.h1.h,
      color: Colors.grey[300],
    );

// Widget buildArticleItem(article, context) => InkWell(
//       onTap: () {
//         // navigateTo(
//         //     context,
//         //     WebViewScreen(
//         //       article['url'],
//         //     ));
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             Container(
//               width: 120.0,
//               height: 120.0,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//                 image: DecorationImage(
//                   image: NetworkImage('${article['urlToImage']}'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width:AppSize.w20.w,
//             ),
//             Expanded(
//               child: Container(
//                 height: 120.0,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         '${article['title']}',
//                         style: Theme.of(context).textTheme.bodyText1,
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Text(
//                       '${article['publishedAt']}',
//                       style: const TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

// Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
//       condition: list.length > 0,
//       builder: (context) => ListView.separated(
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context, index) => buildArticleItem(list[index], context),
//         separatorBuilder: (context, index) => myDivider(),
//         itemCount: 10,
//       ),
//       fallback: (context) => isSearch
//           ? Container()
//           : const Center(child: CircularProgressIndicator()),
//     );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: AppFontsSizeManager.s16.sp);

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }

  return color;
}

defaultAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
}) {
  return AppBar(
      titleSpacing: AppSize.w5.w,
      actions: actions,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text(title));
}

void navigateToFinish({required context, required widget}) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => widget), (route) {
    return false;
  });
}

// Widget defaultButton({
//   double width = double.infinity,
//   Color background = Colors.blue,
//   bool isUpperCase = true,
//   double radius = 3.0,
//   required Function() function,
//   required String text,
// }) =>
//     Container(
//       width: width,
//       height: 50.0,
//       child: MaterialButton(
//         onPressed: function,
//         child: Text(
//           isUpperCase ? text.toUpperCase() : text,
//           style: const TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(
//           radius,
//         ),
//         color: background,
//       ),
//     );
Widget defaultTextButton({
  required Function() function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(text.toUpperCase()),
    );
Widget defaultFormField(
        {required TextEditingController controller,
        required TextInputType type,
        Function? onSubmit,
        Function? onChange,
        bool isPassword = false,
        required String titlevalidate,
        required String label,
        required IconData prefix,
        final Function()? onTap,
        bool isClickable = true,
        final Function()? suffixfun,
        IconData? suffix,
        required}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      validator: ((value) {
        if (value != null && value.isEmpty) {
          // ignore: unnecessary_brace_in_string_interps
          return titlevalidate;
        }
        return null;
      }),
      enabled: isClickable,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        suffix: InkWell(
          child: Icon(suffix),
          onTap: suffixfun,
        ),
        prefixIcon: Icon(
          prefix,
        ),
        border: const OutlineInputBorder(),
      ),
    );
