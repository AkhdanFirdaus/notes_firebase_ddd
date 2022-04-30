import 'package:auto_route/auto_route.dart';
import 'package:ddd_notes/presentation/sign_in/sign_in_page.dart';
import 'package:ddd_notes/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignInPage),
  ],
)
class AppRouter extends _$AppRouter {}
