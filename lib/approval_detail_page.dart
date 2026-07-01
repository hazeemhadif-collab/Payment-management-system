import 'package:flutter/material.dart';
import 'package:paymentmanagement/models/payment.dart';
import 'package:paymentmanagement/login_page.dart';

class ApprovalDetailPage extends StatefulWidget {
  final Payment payment;

  const ApprovalDetailPage({
    super.key,
    required this.payment,
  });

  @override
  State<ApprovalDetailPage> createState() =>
      _ApprovalDetailPageState();
}

class _ApprovalDetailPageState
    extends State<ApprovalDetailPage> {

  void approvePayment() {

    setState(() {
      widget.payment.status = "Approved";
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Payment Approved",
          ),
          content: const Text(
            "Customer payment has been approved successfully.",
          ),
          actions: [

            ElevatedButton(
              onPressed: () {

                Navigator.pop(context);

                Navigator.pop(context);
              },
              child: const Text(
                "OK",
              ),
            ),
          ],
        );
      },
    );
  }

  void rejectPayment() {

    setState(() {
      widget.payment.status = "Rejected";
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Payment Rejected",
          ),
          content: const Text(
            "Customer payment has been rejected.",
          ),
          actions: [

            ElevatedButton(
              onPressed: () {

                Navigator.pop(context);

                Navigator.pop(context);
              },
              child: const Text(
                "OK",
              ),
            ),
          ],
        );
      },
    );
  }

  Widget detailRow(
      String title,
      String value,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
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
                      "Payment Approval Details",
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
                    width: 700,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius:
                      BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        const Text(
                          "Customer Payment Details",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 25),

                        detailRow(
                          "Customer Name",
                          widget.payment.customerName,
                        ),

                        detailRow(
                          "Email",
                          widget.payment.email,
                        ),

                        detailRow(
                          "Room Type",
                          widget.payment.roomType,
                        ),

                        detailRow(
                          "Room Number",
                          widget.payment.roomNumber,
                        ),

                        detailRow(
                          "Bank Type",
                          widget.payment.bankType,
                        ),

                        detailRow(
                          "Account Number",
                          widget.payment.accountNumber,
                        ),

                        detailRow(
                          "Amount",
                          "RM ${widget.payment.amount}",
                        ),

                        detailRow(
                          "Status",
                          widget.payment.status,
                        ),

                        const SizedBox(height: 30),

                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [

                            ElevatedButton(
                              onPressed:
                              approvePayment,
                              child: const Text(
                                "Approve",
                              ),
                            ),

                            const SizedBox(width: 20),

                            ElevatedButton(
                              onPressed:
                              rejectPayment,
                              style:
                              ElevatedButton.styleFrom(
                                backgroundColor:
                                Colors.red,
                              ),
                              child: const Text(
                                "Reject",
                              ),
                            ),
                          ],
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