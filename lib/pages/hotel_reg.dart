import 'package:flutter/material.dart';
import 'package:hotel_hubb/components/my_button.dart';
import 'package:hotel_hubb/components/normal_tf.dart';
import 'package:hotel_hubb/components/password_tf.dart';
import 'package:hotel_hubb/pages/hotel_log.dart';


class RegHotel extends StatelessWidget {
  RegHotel({super.key});

  //controllers
  final hotelnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //register method
  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                //welcome to hotelhubb
                const Text(
                  'Welcome to HotelHubb',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),


                const SizedBox(height: 25),



                //hotelname textfield
                NormalTf(
                  controller: hotelnameController, 
                  hintText: "Hotel Name", 
                  obscureText: false
                ),

                const SizedBox(height: 10),


                //email textfield
                NormalTf(
                  controller: emailController, 
                  hintText: 'Email', 
                  obscureText: false
                ),

                const SizedBox(height: 10),
                //password textfield
                PasswordTf(
                  controller: passwordController, 
                  hintText: 'Confirm Password'
                ),


                const SizedBox(height: 10),

                //confirm password textfield
                PasswordTf(
                  controller: confirmPasswordController, 
                  hintText: 'Confirm Password'
                ),

                const SizedBox(height: 20),


                //register now button
                MyButton(
                  onTap: register, 
                  buttonText: "Register Now"
                ),

                const SizedBox(height: 50),

                //Already a member login
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a Memeber?',
                    ),

                    const SizedBox(width: 4),

                    TextButton(onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return const HoteLogin();
                        }
                      ));
                    }, child: const Text(
                      'Login now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  )
                  ],
                )
                
              ],
            ),
          ),
        )
      ),
    );
  }
}