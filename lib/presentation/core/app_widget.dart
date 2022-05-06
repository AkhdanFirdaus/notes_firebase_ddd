import 'package:ddd_notes/application/auth/auth_bloc.dart';
import 'package:ddd_notes/injection.dart';
import 'package:ddd_notes/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        ),
      ],
      child: MaterialApp.router(
        title: 'DDD Notes',
        debugShowCheckedModeBanner: false,
        routerDelegate: _router.delegate(),
        routeInformationParser: _router.defaultRouteParser(),
        theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.green[800],
            secondary: Colors.blueAccent,
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue[900],
          ),
        ),
      ),
    );
  }
}
