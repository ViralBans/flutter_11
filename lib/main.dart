import 'package:flutter/material.dart';
import 'package:flutter_11/screen/detail.dart';
import 'package:flutter_11/screen/home.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Homework 11',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const Home();
          },
          routes: <GoRoute>[
            GoRoute(
              name: 'detail',
              path: 'detail/:tag/:description/:image',
              builder: (BuildContext context, GoRouterState state) {
                return Detail(
                  tag: state.params['tag']!,
                  description: state.params['description']!,
                  image: state.params['image']!,
                );
              },
            ),
          ]),
    ],
  );
}
