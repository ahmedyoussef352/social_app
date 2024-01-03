import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fashiontik/core/config/app_values.dart';
import 'package:fashiontik/core/cubit/home_layout/cubit.dart';
import 'package:fashiontik/core/cubit/home_layout/states.dart';
import 'package:fashiontik/view/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
            appBar: AppBar(
              title: const Text('User Screen'),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppPadding.p10,
                horizontal: AppPadding.p10,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: AppSize.w25.w,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/satisfied-bearded-male-youngster-listens-merry-song-headphones-moves-pink-background-boosts-mood-with-cool-music-feels-upbeat-wears-red-hat-black-t-shirt_273609-34632.jpg'),
                  ),
                  SizedBox(width: 15.0),
                  Text(
                    'ahmed youssef',
                    style: TextStyle(height: 1.4),
                  )
                ],
              ),
            ));
      },
    );
  }
}
