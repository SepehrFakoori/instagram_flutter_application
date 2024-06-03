import 'package:flutter/material.dart';
import 'package:instagram_flutter_application/screens/activity_screen.dart';
import 'package:instagram_flutter_application/screens/home_screen.dart';
import 'package:instagram_flutter_application/screens/add_content_screen.dart';
import 'package:instagram_flutter_application/screens/main_screen.dart';
import 'package:instagram_flutter_application/screens/search_screen.dart';
import 'package:instagram_flutter_application/screens/user_profile_screen.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            color: Colors.white,
            fontFamily: 'GB',
            fontSize: 16,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffF35383),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            textStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'GB',
              fontSize: 16,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
