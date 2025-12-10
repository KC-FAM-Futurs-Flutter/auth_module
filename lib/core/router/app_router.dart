import 'dart:async';

import 'package:auth_module/core/locator/locator.dart';
import 'package:auth_module/start/cubits/start_app/start_app_cubit.dart';
import 'package:auth_module/start/ui/pages/initial_page.dart';
import 'package:auth_module/auth/ui/pages/login_page.dart';
import 'package:auth_module/auth/ui/pages/register_page.dart';
import 'package:auth_module/auth/ui/pages/welcome_page.dart';
import 'package:auth_module/home/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes { init, welcome, login, register, home }

final useBloc = locator<StartAppCubit>();

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  refreshListenable: GoRouterRefreshStream(useBloc.stream),
  redirect: (context, state) {
    if (useBloc.state.isLoged == true) {
      return '/home';
    }
    if (useBloc.state.isLoged == false) {
      return '/welcome';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.init.name,
      builder: (contex, state) {
        return InitialPage();
      },
    ),
    GoRoute(
      path: '/welcome',
      name: AppRoutes.welcome.name,
      builder: (contex, state) {
        return WelcomePage();
      },
      routes: [
        GoRoute(
          path: '/login',
          name: AppRoutes.login.name,
          builder: (contex, state) {
            return LoginPage();
          },
          routes: [],
        ),
        GoRoute(
          path: '/register',
          name: AppRoutes.register.name,
          builder: (contex, state) {
            return RegisterPage();
          },
          routes: [],
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      name: AppRoutes.home.name,
      builder: (contex, state) {
        return HomePage();
      },
      routes: [],
    ),
  ],
);

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subcription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subcription;

  @override
  void dispose() {
    _subcription.cancel();
    super.dispose();
  }
}
