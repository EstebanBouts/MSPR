import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mae_projet/page/fiche_page.dart';
import 'page/home_page.dart'; // Assurez-vous que le chemin d'accès est correct
import 'page/signup_page.dart';
import 'page/forgetmdp.dart';
import 'page/map_page.dart';

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
      path: '/map',
      builder: (BuildContext context, GoRouterState state) => MapPage(),
      routes: [  // Ajout d'une route imbriquée pour 'FichePage'
        GoRoute(
          path: 'fiche',  // le chemin est relatif à '/map'
          builder: (BuildContext context, GoRouterState state) => FichePage(
            nomPlante: '',
            geoLocation: '',
            imageUrl: '',
            proprietaire: '',
          ),
        ),
      ],
    ),
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
