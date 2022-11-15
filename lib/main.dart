import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'providers/messages.dart';
import 'providers/index.dart';
import 'providers/scrollinchat.dart';
import 'providers/user.dart';

import 'pages/mainpage.dart';
import 'pages/userprofile.dart';
import 'pages/enterpage.dart';

import 'constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Messages(),
        ),
        ChangeNotifierProvider(
          create: (context) => Index(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScrollInChat(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'AI Horoscope',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Consolas',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            foregroundColor: Color(0xff434F6D),
          ),
          brightness: Brightness.light,
          textTheme: TextTheme(
            displayLarge: TextStyle(color: maingrey),
            displayMedium: TextStyle(color: maingrey),
            displaySmall: TextStyle(color: maingrey),
            headlineLarge: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            headlineMedium: const TextStyle(
              fontSize: 20,
            ),
            bodyLarge: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: maingrey,
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
              color: maingrey,
            ),
            bodySmall: TextStyle(
              fontSize: 14,
              color: maingrey,
            ),
            labelSmall: TextStyle(
              fontSize: 12,
              color: maingrey,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: mainpink,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.only(left: 10),
            filled: true,
            fillColor: transparentwhite,
            labelStyle: TextStyle(color: maingrey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: transparentwhite,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: transparentwhite,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: transparentwhite,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: transparentwhite,
                width: 2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: transparentwhite,
                width: 2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: transparentwhite,
                width: 2,
              ),
            ),
          ),
        ),
        home: const EnterPage(),
        routes: {
          MainPage.routename: (context) => const MainPage(),
          UserProfileScreen.routename: (context) => const UserProfileScreen()
        },
      ),
    );
  }
}
