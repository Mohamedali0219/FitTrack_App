import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/features/auth/ui/auth_ui/login/login_screen.dart';
import 'package:fit_track_app/features/category/logic/category_bloc/category_cubit.dart';
import 'package:fit_track_app/features/category/logic/category_bloc/category_event.dart';
import 'package:fit_track_app/features/category/logic/services/category_service.dart';
import 'package:fit_track_app/features/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/splash/splash_view.dart';


class FitTrackApp extends StatefulWidget {
  const FitTrackApp({super.key});

  @override
  State<FitTrackApp> createState() => _FitTrackAppState();
}

@override
void initState() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      // print('User is currently signed out!');
    } else {
      // print('User is signed in!');
    }
  });
}

class _FitTrackAppState extends State<FitTrackApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CategoryBloc(
                CategoryService(),
                ImageService(),
              )..add(FetchCategories()), // Fetch categories on startup
            ),
          ],
          child: MaterialApp(
            title: 'Fit Track',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: ColorsManager.whiteColor,
              colorScheme: ColorScheme.fromSeed(
                seedColor: ColorsManager.orangeColor,
              ),
              useMaterial3: true,
            ),
            home: FirebaseAuth.instance.currentUser == null
                ? const LoginScreen()
                : const SplashScreen(),
          ),
        ),
      ),
    );
  }
}
