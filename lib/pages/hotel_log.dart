import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hubb/components/my_button.dart';
import 'package:hotel_hubb/components/normal_tf.dart';
import 'package:hotel_hubb/components/password_tf.dart';
import 'package:hotel_hubb/pages/hotel_reg.dart';

class HoteLogin extends StatefulWidget {
  HoteLogin({super.key});

  @override
  State<HoteLogin> createState() => _HoteLoginState();
}

class _HoteLoginState extends State<HoteLogin> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //login method
  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        //show error to user
        wrongEmailMessage();
      }
      else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context, 
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Password'),
        );
      }
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context, 
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Password'),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
              child: Column(
            children: [
              //welcome back text
              Text(
                'Welcome back you\'ve been missed',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 25),

              //email textfield
              NormalTf(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false),

              const SizedBox(height: 10),

              //Password textfield
              PasswordTf(controller: passwordController, hintText: 'Password'),

              const SizedBox(height: 25),

              //login button
              MyButton(onTap: login, buttonText: "Login"),

              const SizedBox(height: 50),

              //Not a member register now
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return RegHotel();
                    }));
                  },
                  child: const Text(
                    'Register Now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ])
            ],
          )),
        ),
      ),
    );
  }
}
