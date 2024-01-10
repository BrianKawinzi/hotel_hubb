import 'package:flutter/material.dart';
import 'package:hotel_hubb/pages/hotel_reg.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(
              left: 80.0,
              right: 80,
              bottom: 40,
              top: 160,
            ),
            child: Image.asset('lib/images/logo.png'),
          ),



          //HotelHubb the best solutions for you
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              "HotelHubb the best solution for you!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 24),


          //your software cashbook
          const Text(
            "your software cashbook",
            style: TextStyle(
              color: Color.fromARGB(255, 134, 132, 132)
            ),
          ),

          const Spacer(),


          //get started button
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const RegHotel();
              }
            )),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 253, 156, 0),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const Spacer(),
        ],
      )
    );
  }
}