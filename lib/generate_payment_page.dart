import 'package:flutter/material.dart';
import 'package:paymentmanagement/data/hotel_statistics.dart';
import 'package:paymentmanagement/data/payment_report_data.dart';
import 'package:paymentmanagement/models/payment.dart';
import 'package:paymentmanagement/models/payment_report.dart';

class GeneratePaymentPage extends StatefulWidget {
  final Payment payment;

  const GeneratePaymentPage({
    super.key,
    required this.payment,
  });

  @override
  State<GeneratePaymentPage> createState() =>
      _GeneratePaymentPageState();
}

class _GeneratePaymentPageState
    extends State<GeneratePaymentPage> {

  bool reportGenerated = false;

  void generateReport() {

    double revenue =
        double.tryParse(widget.payment.amount) ?? 0;

    double cost = revenue * 0.30;

    HotelStatistics.totalRevenue += revenue;
    HotelStatistics.totalCost += cost;


    if (reportGenerated) return;

    setState(() {
      reportGenerated = true;
    });

    PaymentReportData.reports.add(
      PaymentReport(
        customerName: widget.payment.customerName,
        email: widget.payment.email,
        roomType: widget.payment.roomType,
        roomNumber: widget.payment.roomNumber,
        bankType: widget.payment.bankType,
        accountNumber: widget.payment.accountNumber,
        amount: widget.payment.amount,
      ),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Report Generated",
          ),
          content: const Text(
            "Payment report generated successfully.",
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

    double revenue =
        double.tryParse(widget.payment.amount) ?? 0;

    double estimatedCost = revenue * 0.30;

    double profitLoss = revenue - estimatedCost;

    double occupancyRate = 75.0;

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

                    Image.asset(
                      'assets/images/danai logo.png',
                      width: 65,
                    ),

                    const SizedBox(width: 10),

                    const Text(
                      "Generate Payment Report",
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
                          "Payment Report Preview",
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

                        const Divider(),

                        detailRow(
                          "Revenue",
                          "RM ${revenue.toStringAsFixed(2)}",
                        ),

                        detailRow(
                          "Estimated Cost",
                          "RM ${estimatedCost.toStringAsFixed(2)}",
                        ),

                        detailRow(
                          "Profit / Loss",
                          profitLoss >= 0
                              ? "Profit RM ${profitLoss.toStringAsFixed(2)}"
                              : "Loss RM ${profitLoss.abs().toStringAsFixed(2)}",
                        ),

                        detailRow(
                          "Occupancy Rate",
                          "${occupancyRate.toStringAsFixed(1)}%",
                        ),

                        const SizedBox(height: 30),

                        ElevatedButton(
                          onPressed: reportGenerated
                              ? null
                              : generateReport,
                          child: const Text(
                            "Generate Report",
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