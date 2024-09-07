import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:media_social/screens/homepage.dart';
import 'package:media_social/screens/view_post_screen.dart';
import 'package:media_social/utils/route_names.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: RouteNames.homePage,
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomePage());
        },
      ),
      GoRoute(
        path: "/post/:data",
        name: RouteNames.postViewPage,
        pageBuilder: (context, state) {
          return MaterialPage(
              child: ViewSinglePost(
            data: state.pathParameters["data"],
          ));
        },
      )
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(
          child: Scaffold(
        body: Center(
          child: Text("Error 404"),
        ),
      ));
    },
  );

  static GoRouter get router => _router;
}
