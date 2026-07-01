import 'package:flutter/material.dart';
import 'package:paymentmanagement/login_page.dart';
import 'package:paymentmanagement/activity_page.dart';
import 'package:paymentmanagement/room_type_page.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          // Navigation Bar
          Container(
            height: 90,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: const Color(0xFF0D8B94),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [

                // Logo
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                          (route) => false,
                    );
                  },
                  child: Image.asset(
                    'assets/images/danai logo.png',
                    width: 65,
                  ),
                ),

                const SizedBox(width: 10),

                // Hotel Name
                const Text(
                  "Danai Retreat",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const Spacer(),

                // Home Button
                TextButton(
                  onPressed: () {
                    // Stay on homepage
                  },
                  child: const Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                // Room Button
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RoomTypePage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Room",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                // Activities Button
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ActivityPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Activities",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [

                // Background Image
                Image.asset(
                  'assets/images/resort bridge.jpg',
                  fit: BoxFit.cover,
                ),

                // Dark Overlay
                Container(
                  color: Colors.black.withOpacity(0.25),
                ),

                // Welcome Text
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        "Welcome to",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Danai Retreat",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 15),

                      Text(
                        "Experience Luxury and Comfort",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}