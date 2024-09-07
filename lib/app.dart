import 'package:flutter/material.dart';
import 'package:media_social/utils/router.dart';
import 'package:media_social/utils/string_const.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
    );
  }
}
