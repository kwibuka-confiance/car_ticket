import 'package:car_ticket/domain/repositories/user/firebase_user_repository.dart';
import 'package:car_ticket/domain/repositories/user/user_repository.dart';
import 'package:car_ticket/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:car_ticket/presentation/screens/auth/auth_screen.dart';
import 'package:car_ticket/presentation/screens/car_all_details/car_available_more_details.dart';
import 'package:car_ticket/presentation/screens/main_screen/navigations.dart';
import 'package:car_ticket/presentation/screens/onboarding/onboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp(
    userRepository: FirebaseUserRepository(firebaseAuth: FirebaseAuth.instance),
  ));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp({required this.userRepository, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(userRepository: userRepository),
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state.status == AuthenticationStatus.authenticated) {
                      return const Navigations();
                    } else if (state.status ==
                        AuthenticationStatus.unauthenticated) {
                      return const AuthScreen();
                    }
                    return const OnboardingScreen();
                  },
                ),
                routes: {
                  OnboardingScreen.routeName: (context) =>
                      const OnboardingScreen(),
                  AuthScreen.routeName: (context) => const AuthScreen(),
                  Navigations.routeName: (context) => const Navigations(),
                  CarAvailableDetails.routeName: (context) =>
                      const CarAvailableDetails(),
                });
          }),
    );
  }
}
