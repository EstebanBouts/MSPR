import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mae_projet/page/registrationPage.dart';
import 'page/home_page.dart'; // Assurez-vous que le chemin d'accès est correct
import 'page/map_page.dart';
import 'page/signup_page.dart';
import 'page/forgetmdp.dart';
import 'page/registrationPage.dart';
import 'page/registrationImage.dart';
import 'page/conseil.dart';
import 'page/chat.dart';


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
    GoRoute(
      path: '/registration',
      builder: (BuildContext context, GoRouterState state) => const RegistrationPage(),
    ),
    GoRoute(
    path: '/map',
    builder: (BuildContext context, GoRouterState state) => const MapPage(),
    ),
    GoRoute(
      path: '/conseil',
      builder: (BuildContext context, GoRouterState state) => const ConseilPage(),
    ),
    GoRoute(
      path: '/chat',
      builder: (BuildContext context, GoRouterState state) => const Chat(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
