import 'package:flutter/material.dart';
import 'package:paymentmanagement/data/payment_data.dart';
import 'package:paymentmanagement/login_page.dart';
import 'package:paymentmanagement/data/reservation_data.dart';
import 'package:paymentmanagement/models/payment.dart';
import 'package:paymentmanagement/models/reservation.dart';
import 'package:paymentmanagement/receipt_upload_page.dart';


class PaymentReservationPage extends StatefulWidget {
  final String customerName;
  final String email;
  final String phoneNumber;
  final String roomType;
  final String roomNumber;
  final DateTime checkInDate;
  final DateTime checkOutDate;

  const PaymentReservationPage({
    super.key,
    required this.customerName,
    required this.email,
    required this.phoneNumber,
    required this.roomType,
    required this.roomNumber,
    required this.checkInDate,
    required this.checkOutDate,
  });

  @override
  State<PaymentReservationPage> createState() =>
      _PaymentReservationPageState();
}

class _PaymentReservationPageState
    extends State<PaymentReservationPage> {


  final TextEditingController accountController =
  TextEditingController();

  final TextEditingController amountController =
  TextEditingController();

  String selectedBank = "Maybank";

  //String? receiptPath;

  int get numberOfNights {
    return widget.checkOutDate
        .difference(widget.checkInDate)
        .inDays;
  }

  double get totalPrice {
    return numberOfNights * 300.0;
  }



  @override
  void initState() {
    super.initState();

    amountController.text =
        totalPrice.toStringAsFixed(2);
  }


  void makePayment() {

    if (accountController.text.isEmpty ||
        amountController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please complete all payment details.",
          ),
        ),
      );
      return;
    }

    ReservationData.reservations.add(
      Reservation(
        customerName: widget.customerName,
        email: widget.email,
        phoneNumber: widget.phoneNumber,
        roomType: widget.roomType,
        roomNumber: widget.roomNumber,
        paymentAmount: amountController.text,
        checkInDate: widget.checkInDate,
        checkOutDate: widget.checkOutDate,
        status: "Reserved",
      ),
    );

    PaymentData.payments.add(
      Payment(
        customerName: widget.customerName,
        email: widget.email,
        roomType: widget.roomType,
        roomNumber: widget.roomNumber,
        bankType: selectedBank,
        accountNumber: accountController.text,
        amount: amountController.text,
        status: "Pending",
      ),
    );

    print("====================");
    print("Payment Saved");
    print("Total Payments: ${PaymentData.payments.length}");

    for (var p in PaymentData.payments) {
      print("${p.customerName} - ${p.amount}");
    }
    print("====================");


    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Payment Successful",
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              ),

              const SizedBox(height: 15),

              Text(
                "Customer: ${widget.customerName}",
              ),

              Text(
                "Bank: $selectedBank",
              ),

              Text(
                "Amount: RM ${amountController.text}",
              ),

              const SizedBox(height: 15),

              const Text(
                "Payment submitted successfully.\nPlease upload your payment receipt on the next page.",
                textAlign: TextAlign.center,
              )
            ],
          ),
          actions: [


            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ReceiptUploadPage(),
                  ),
                );
              },
              child: const Text("Continue"),
            ),
          ],
        );
      },
    );



    // Later:
    // Send reservation/payment data
    // to General Manager page
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

              // Header
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
                    width: 500,
                    padding:
                    const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.95),
                      borderRadius:
                      BorderRadius.circular(
                          20),
                    ),
                    child: Column(
                      mainAxisSize:
                      MainAxisSize.min,
                      children: [

                        const Text(
                          "Payment Reservation",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        const SizedBox(
                            height: 25),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.teal.shade50,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [

                              Text("Room: ${widget.roomNumber}"),

                              Text("Room Type: ${widget.roomType}"),

                              Text(
                                "Check In: "
                                    "${widget.checkInDate.day}/"
                                    "${widget.checkInDate.month}/"
                                    "${widget.checkInDate.year}",
                              ),

                              Text(
                                "Check Out: "
                                    "${widget.checkOutDate.day}/"
                                    "${widget.checkOutDate.month}/"
                                    "${widget.checkOutDate.year}",
                              ),

                              Text(
                                "Number of Nights: $numberOfNights",
                              ),

                              Text(
                                "Price Per Night: RM 300",
                              ),

                              const Divider(),

                              Text(
                                "Total Amount: RM ${totalPrice.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),

                        DropdownButtonFormField<
                            String>(
                          value: selectedBank,
                          decoration:
                          const InputDecoration(
                            labelText:
                            "Select Bank",
                            border:
                            OutlineInputBorder(),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: "Maybank",
                              child:
                              Text("Maybank"),
                            ),
                            DropdownMenuItem(
                              value: "CIMB",
                              child:
                              Text("CIMB"),
                            ),
                            DropdownMenuItem(
                              value:
                              "Public Bank",
                              child: Text(
                                  "Public Bank"),
                            ),
                            DropdownMenuItem(
                              value: "RHB",
                              child:
                              Text("RHB"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedBank =
                              value!;
                            });
                          },
                        ),

                        const SizedBox(height: 15),

                        TextField(
                          controller: accountController,
                          decoration: const InputDecoration(
                            labelText: "Bank Account Number",
                            border: OutlineInputBorder(),
                          ),
                        ),




                        const SizedBox(
                            height: 15),

                        TextField(
                          controller: amountController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: "Amount (RM)",
                            border: OutlineInputBorder(),
                          ),
                        ),



                        const SizedBox(
                            height: 25),

                        SizedBox(
                          width:
                          double.infinity,
                          height: 50,
                          child:
                          ElevatedButton(
                            onPressed:
                            makePayment,
                            child:
                            const Text(
                              "Pay Now",
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