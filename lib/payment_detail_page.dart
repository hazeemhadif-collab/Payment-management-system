import 'package:flutter/material.dart';
import 'package:paymentmanagement/login_page.dart';
import 'models/payment.dart';
import 'package:paymentmanagement/generate_payment_page.dart';

class PaymentDetailPage extends StatelessWidget {
  final Payment payment;

  const PaymentDetailPage({
    super.key,
    required this.payment,
  });

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
              color: Colors.black.withOpacity(0.25),
            ),
          ),

          Column(
            children: [

              // Header
              Container(
                height: 90,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
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
                      "Payment Details",
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
                  child: SingleChildScrollView(
                    child: Container(
                      width: 650,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius:
                        BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [

                          const Center(
                            child: Text(
                              "Customer Payment Information",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          detailRow(
                            "Customer Name",
                            payment.customerName,
                          ),

                          detailRow(
                            "Email",
                            payment.email,
                          ),

                          detailRow(
                            "Room Type",
                            payment.roomType,
                          ),

                          detailRow(
                            "Room Number",
                            payment.roomNumber,
                          ),

                          detailRow(
                            "Bank Type",
                            payment.bankType,
                          ),

                          detailRow(
                            "Account Number",
                            payment.accountNumber,
                          ),

                          detailRow(
                            "Payment Amount",
                            "RM ${payment.amount}",
                          ),

                          detailRow(
                            "Status",
                            payment.status,
                          ),

                          const SizedBox(height: 30),

                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        GeneratePaymentPage(
                                          payment: payment,
                                        ),
                                  ),
                                );
                              },
                              child: const Text(
                                "Generate Report",
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget detailRow(
      String title,
      String value,
      ) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [

          SizedBox(
            width: 180,
            child: Text(
              "$title :",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),

          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}