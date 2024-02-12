import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  


  const NavigationDrawerWidget({super.key});
  


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.orange,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange.shade700,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'lib/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 10),

                  
                ],
              ),
            ),
            buildDrawerItem("Home", Icons.home, () {}),
            buildDrawerItem("Suggestions", Icons.lightbulb, () {}),
            buildDrawerItem("Contact Us", Icons.phone, () {}),
            buildDrawerItem("About", Icons.info, () {}),
            buildDrawerItem("Settings", Icons.settings, () {}),
            buildDrawerItem("Registration", Icons.person_add, () {}),
            const Divider(color: Colors.white),
            buildDrawerItem("Logout", Icons.logout, () {
              _handleLogout(context);
            }),
            
          ],
        ),
      ),
    );
  }

  ListTile buildDrawerItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      onTap: onTap,
    );
  }

  //logout method
  void _handleLogout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacementNamed('/login');
    } catch (e) {
      print('Error during logout: $e');
    }
  }
}