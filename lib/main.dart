import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hotel_hubb/pages/auth_page.dart';
import 'package:hotel_hubb/pages/hotel_log.dart';
import 'package:hotel_hubb/pages/hotel_reg.dart';
import 'package:hotel_hubb/pages/intro_page.dart';
import 'firebase_options.dart';
import 'package:hotel_hubb/pages/bottom_navigation.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HotelHubb',
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const AuthPage(),
        '/login': (context) => HoteLogin(),
        '/register': (context) => RegHotel(),
      },
    );
  }
}

