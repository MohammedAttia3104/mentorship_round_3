import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.loginScreen:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => BlocProvider(
      //       create: (context) => sl<LoginCubit>(),
      //       child: LoginScreen(),
      //     ),
      //   );
      default:
        return null;
    }
  }
}
