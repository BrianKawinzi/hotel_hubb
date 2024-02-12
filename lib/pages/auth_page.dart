import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:hotel_hubb/pages/bottom_navigation.dart';
import 'package:hotel_hubb/pages/hotel_log.dart';
import 'package:hotel_hubb/pages/intro_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          //user is logged in
          if (snapshot.hasData) {
            return const BottomNavigation();
          }
          //user is not logged in
          else {
            return const IntroPage();
          }
        },
      ),
    );
  }
}