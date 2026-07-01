import 'package:flutter/material.dart';
import 'package:paymentmanagement/models/transaction.dart';

class VerifyPage extends StatefulWidget {
  final Transaction transaction;

  const VerifyPage({
    super.key,
    required this.transaction,
  });

  @override
  State<VerifyPage> createState() =>
      _VerifyPageState();
}

class _VerifyPageState
    extends State<VerifyPage> {

  void verifyTransaction() {

    setState(() {
      widget.transaction.status = "Verified";
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Verification Complete",
          ),
          content: const Text(
            "Transaction has been successfully verified.",
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

          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/resort bridge.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Overlay
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

                    Image.asset(
                      'assets/images/danai logo.png',
                      width: 65,
                    ),

                    const SizedBox(width: 10),

                    const Text(
                      "Verify Transaction",
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
                      padding:
                      const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color:
                        Colors.white.withOpacity(
                            0.95),
                        borderRadius:
                        BorderRadius.circular(
                            20),
                      ),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [

                          const Center(
                            child: Text(
                              "Transaction Details",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          detailRow(
                            "Transaction ID",
                            widget.transaction
                                .transactionId,
                          ),

                          detailRow(
                            "Transaction Type",
                            widget.transaction
                                .transactionType,
                          ),

                          detailRow(
                            "Party Name",
                            widget.transaction
                                .partyName,
                          ),

                          detailRow(
                            "Amount",
                            "RM ${widget.transaction.amount}",
                          ),

                          detailRow(
                            "Status",
                            widget.transaction
                                .status,
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          Center(
                            child: ElevatedButton(
                              onPressed:
                              widget.transaction
                                  .status ==
                                  "Verified"
                                  ? null
                                  : verifyTransaction,
                              child: const Text(
                                "Verify Transaction",
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
}