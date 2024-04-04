// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, depend_on_referenced_packages, unnecessary_import, deprecated_member_use, unused_import

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/gen/assets.gen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa', '') //farsi
        ],
        theme: ThemeData(
            fontFamily: 'dana',
            textTheme: TextTheme(
                headline1: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    color: Color.fromARGB(255, 70, 70, 70)),
                headline2: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    color: Color.fromARGB(255, 70, 70, 70)),
                headline3: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    color: Color.fromARGB(255, 70, 70, 70)),
                headline4: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    color: Color.fromARGB(255, 70, 70, 70)),
                bodyText1: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    color: Color.fromARGB(255, 70, 70, 70)))),
        home: Scaffold(
          body: Center(
            child: Image(image: Assets.images.logo.provider()),
          ),
        ));
  }
}
