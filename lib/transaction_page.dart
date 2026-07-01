import 'package:flutter/material.dart';
import 'package:paymentmanagement/data/transaction_data.dart';
import 'package:paymentmanagement/login_page.dart';
import 'package:paymentmanagement/models/transaction.dart';
import 'package:paymentmanagement/verify_page.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() =>
      _TransactionPageState();
}

class _TransactionPageState
    extends State<TransactionPage> {

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
                      "Transaction Records",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Pending Transactions",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount:
                  TransactionData.transactions.length,
                  itemBuilder: (context, index) {

                    Transaction transaction =
                    TransactionData.transactions[index];

                    return Card(
                      margin: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: ListTile(

                        leading: const Icon(
                          Icons.receipt_long,
                          size: 40,
                          color: Colors.teal,
                        ),

                        title: Text(
                          transaction.partyName,
                        ),

                        subtitle: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [

                            Text(
                              transaction.transactionType,
                            ),

                            Text(
                              "Transaction ID: ${transaction.transactionId}",
                            ),

                            Text(
                              "RM ${transaction.amount}",
                            ),

                            Text(
                              transaction.status,
                              style: TextStyle(
                                color: transaction.status == "Verified"
                                    ? Colors.green
                                    : Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        trailing: ElevatedButton(
                          onPressed: transaction.status == "Verified"
                              ? null
                              : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyPage(
                                  transaction: transaction,
                                ),
                              ),
                            ).then((_) {
                              setState(() {});
                            });
                          },
                          child: Text(
                            transaction.status == "Verified"
                                ? "Verified"
                                : "Verify",
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