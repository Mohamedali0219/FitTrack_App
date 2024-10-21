import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/features/meals/logic/cubit/get_meals_cubit.dart';
import 'package:fit_track_app/features/meals/ui/meals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetMealsCubit>(create: (context) => GetMealsCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: SafeArea(
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
            home: const MealsScreen(),
          ),
        ),
      ),
    );
  }
}
