import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'page/home_page.dart'; // Assurez-vous que le chemin d'accès est correct
import 'page/signup_page.dart';
import 'page/forgetmdp.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) => const SignUpPage(),
    ),
    GoRoute(
      path: '/forget',
      builder: (BuildContext context, GoRouterState state) => const ForgetMdp(),
    ),
    // Vous pouvez ajouter d'autres routes ici si nécessaire
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
