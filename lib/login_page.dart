import 'package:flutter/material.dart';
import 'package:paymentmanagement/customer_page.dart';
import 'package:paymentmanagement/financial_page.dart';
import 'package:paymentmanagement/manager_page.dart';
import 'package:paymentmanagement/staff_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email == "manager@gmail.com" &&
        password == "manager123") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ManagerPage(),
        ),
      );
    } else if (email == "financial@gmail.com" &&
        password == "financial123") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
          const FinancialPage(),
        ),
      );
    } else if (email == "staff@gmail.com" &&
        password == "staff123") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const StaffPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid email or password"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/resort bridge.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Dark Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.35),
            ),
          ),

          // Main Content
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Column(
                  children: [

                    // Logo
                    Image.asset(
                      'assets/images/danai logo.png',
                      width: 220,
                    ),

                    const SizedBox(height: 20),


                    const SizedBox(height: 40),

                    // Login Card
                    SizedBox(
                      width: 420,
                      child: Card(
                        color: Colors.white.withOpacity(0.90),
                        elevation: 12,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding:
                          const EdgeInsets.all(25),
                          child: Column(
                            children: [

                              const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 20),

                              TextField(
                                controller:
                                emailController,
                                decoration:
                                const InputDecoration(
                                  labelText:
                                  "Email Address",
                                  prefixIcon:
                                  Icon(Icons.email),
                                  border:
                                  OutlineInputBorder(),
                                ),
                              ),

                              const SizedBox(height: 15),

                              TextField(
                                controller:
                                passwordController,
                                obscureText: true,
                                decoration:
                                const InputDecoration(
                                  labelText: "Password",
                                  prefixIcon:
                                  Icon(Icons.lock),
                                  border:
                                  OutlineInputBorder(),
                                ),
                              ),

                              const SizedBox(height: 20),

                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: login,
                                  child:
                                  const Text("Login"),
                                ),
                              ),

                              const SizedBox(height: 10),

                              OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const CustomerPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Continue as Guest",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GeneralManagerPage extends StatelessWidget {
  const GeneralManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("General Manager Dashboard"),
      ),
      body: const Center(
        child: Text(
          "Welcome General Manager",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class FinancialExecutivePage extends StatelessWidget {
  const FinancialExecutivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        const Text("Financial Executive Dashboard"),
      ),
      body: const Center(
        child: Text(
          "Welcome Financial Executive",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class HotelStaffPage extends StatelessWidget {
  const HotelStaffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotel Staff Dashboard"),
      ),
      body: const Center(
        child: Text(
          "Welcome Hotel Staff",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class GuestPage extends StatelessWidget {
  const GuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guest Page"),
      ),
      body: const Center(
        child: Text(
          "Welcome Guest",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}