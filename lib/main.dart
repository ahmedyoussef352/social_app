import 'package:fashiontik/bloc_observer.dart';
import 'package:fashiontik/core/config/end_points.dart';
import 'package:fashiontik/core/cubit/home_layout/cubit.dart';
import 'package:fashiontik/core/cubit/home_layout/states.dart';
import 'package:fashiontik/data/local/cache_helper.dart';
import 'package:fashiontik/data/local/remote/dio.dart';
import 'package:fashiontik/view/screens/auth/sign_up/sign_up_screen.dart';
import 'package:fashiontik/view/screens/home_layout/home_screen.dart';
import 'package:fashiontik/view/thems/themes.dart';
import 'package:fashiontik/view/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  // late Widget startWidget;
  // EndPoint.loginToken = CacheHelper.getData(key: 'token');
  // if (EndPoint.loginToken == null) {
  //   startWidget = const SignUpScreen();
  // } else {
  //   startWidget = const SocialHome();
  // }
// token = CacheHelper.getData(key: 'token');
//   uId = CacheHelper.getData(key: 'uId');
  BlocOverrides.runZoned(
    () {},
    blocObserver: MyBlocObserver(),
  );
  runApp(MyApp(
      //startWidget: startWidget
      ));
}

class MyApp extends StatefulWidget {
  final bool? isDark;
  final startWidget;

  const MyApp({super.key, this.isDark, this.startWidget});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => AppCubit()
              //  ..registration()
              // ..login()
              ..getAllUsers()
              ..changeAppMode(fromShared: widget.isDark)),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: lightTheme,
            home: SocialHome(),
          );
        },
      ),
    );
  }
}
