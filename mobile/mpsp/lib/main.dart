import 'package:flutter/material.dart';
import 'package:mpsp/constantes.dart';

import 'package:mpsp/screens/editar/update_screen.dart';
import 'package:mpsp/screens/home/home_screen.dart';
import 'package:mpsp/screens/login/create_login/create_login_screen.dart';
import 'package:mpsp/screens/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MPSP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: cPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: cTextoCor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/homePage': (context) => HomeScreen(),
          '/create_login': (context) => CreateLogin(),
          '/update_login': (context) => UpadateLogin(),
        });
  }
}
