import 'package:flutter/material.dart';
import 'package:paymentmanagement/data/payment_data.dart';
import 'package:paymentmanagement/models/payment.dart';
import 'package:paymentmanagement/login_page.dart';
import 'package:paymentmanagement/approval_detail_page.dart';

class PaymentApprovalPage extends StatefulWidget {
  const PaymentApprovalPage({super.key});

  @override
  State<PaymentApprovalPage> createState() =>
      _PaymentApprovalPageState();
}

class _PaymentApprovalPageState
    extends State<PaymentApprovalPage> {

  void approvePayment(Payment payment) {
    setState(() {
      payment.status = "Approved";
    });
  }

  void rejectPayment(Payment payment) {
    setState(() {
      payment.status = "Rejected";
    });
  }

  Icon getStatusIcon(String status) {
    if (status == "Approved") {
      return const Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 35,
      );
    }

    if (status == "Rejected") {
      return const Icon(
        Icons.cancel,
        color: Colors.red,
        size: 35,
      );
    }

    return const Icon(
      Icons.hourglass_empty,
      color: Colors.orange,
      size: 35,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              'assets/images/resort pool.jpg',
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
                            builder: (context) =>
                            const LoginPage(),
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
                      "Payment Approval",
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
                child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount:
                  PaymentData.payments.length,
                  itemBuilder: (context, index) {

                    Payment payment =
                    PaymentData.payments[index];

                    return Card(
                      color: Colors.white.withOpacity(0.95),
                      margin: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: ListTile(

                        leading: getStatusIcon(
                          payment.status,
                        ),

                        title: Text(
                          payment.customerName,
                        ),

                        subtitle: Text(
                          "RM ${payment.amount}",
                        ),

                        trailing: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ApprovalDetailPage(
                                      payment: payment,
                                    ),
                              ),
                            ).then((_) {
                              setState(() {});
                            });
                          },
                          child: const Text(
                            "View Details",
                          ),
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