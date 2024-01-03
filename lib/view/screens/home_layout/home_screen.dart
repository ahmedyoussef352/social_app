import 'package:fashiontik/core/cubit/home_layout/cubit.dart';
import 'package:fashiontik/core/cubit/home_layout/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialHome extends StatelessWidget {
  const SocialHome({super.key});

  @override
  Widget build(BuildContext context) {
   
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      // if (state is SocialChangePostStates) {
      //   navigateTo(context, NewPostScreen());
      // }
    }, builder: (context, state) {
      var cubit = AppCubit.get(context);
      return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   title: Text('Home'),
        //   //cubit.titles[cubit.currentIndex]),
        //   actions: [
        //     IconButton(
        //         onPressed: () {}, icon: const Icon(Icons.notifications_active)),
        //     IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        //   ],
        // ),
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index) {
            cubit.changeBottomIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  // color: Colors.red,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined), label: 'Chat'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.upload_file_outlined,
                ),
                label: 'Post'),
            BottomNavigationBarItem(
                icon: Icon(Icons.maps_ugc_rounded), label: 'User'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ],
        ),
      );
    });
  }
}
