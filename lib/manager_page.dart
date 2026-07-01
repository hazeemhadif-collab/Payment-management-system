import 'package:flutter/material.dart';
import 'package:paymentmanagement/login_page.dart';
import 'package:paymentmanagement/reservation_generate_page.dart';
import 'package:paymentmanagement/reservation_detail_page.dart';
import 'package:paymentmanagement/overall_report_page.dart';
import 'manager_customer_filter_page.dart';



class ManagerPage extends StatelessWidget {
  const ManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              'assets/images/resort bridge.jpg',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.25),
            ),
          ),

          Column(
            children: [

              Container(
                height: 90,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                color: const Color(0xFF0D8B94),
                child: Row(
                  children: [

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

                    const Text(
                      "Danai Retreat",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        const Text(
                          "General Manager Dashboard",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 30),

                        SizedBox(
                          width: 250,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const ReservationGeneratePage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Reservation Report",
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          width: 250,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const ReservationDetailPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Reservation Detail",
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          width: 250,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const OverallReportPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Overall Monthly Report",
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          width: 250,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const ManagerCustomerFilterPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Customer Filter",
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
        ],
      ),
    );
  }
}