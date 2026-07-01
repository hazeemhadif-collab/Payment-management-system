import 'package:flutter/material.dart';
import 'package:paymentmanagement/data/payment_data.dart';
import 'package:paymentmanagement/login_page.dart';
import 'package:paymentmanagement/models/payment.dart';
import 'package:paymentmanagement/payment_detail_page.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});



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
                padding:
                const EdgeInsets.symmetric(
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
                      "Payment Reports",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Customer Payments",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: PaymentData.payments.isEmpty
                    ? const Center(
                  child: Text(
                    "No Payment Records",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                )
                    : ListView.builder(
                  padding:
                  const EdgeInsets.all(
                      20),
                  itemCount:
                  PaymentData.payments
                      .length,
                  itemBuilder:
                      (context, index) {

                    Payment payment =
                    PaymentData
                        .payments[index];

                    return Card(
                      child: ListTile(
                        title: Text(
                          payment
                              .customerName,
                        ),

                        subtitle: Text(
                          "${payment.roomNumber} • RM ${payment.amount}",
                        ),

                        trailing:
                        ElevatedButton(
                          child: const Text(
                            "View",
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                    PaymentDetailPage(
                                      payment: payment,
                                    ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}