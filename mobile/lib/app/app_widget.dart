import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'HuntApp',
      theme: ThemeData(
        primaryColor: Color(0xffda552f),
        accentColor: Color(0xffda552f),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
