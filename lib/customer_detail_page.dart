import 'package:flutter/material.dart';
import 'package:paymentmanagement/login_page.dart';
import 'package:paymentmanagement/payment_reservation_page.dart';

class CustomerDetailPage extends StatefulWidget {
  final String roomType;
  final String roomNumber;

  const CustomerDetailPage({
    super.key,
    required this.roomType,
    required this.roomNumber,
  });

  @override
  State<CustomerDetailPage> createState() =>
      _CustomerDetailPageState();
}

class _CustomerDetailPageState
    extends State<CustomerDetailPage> {
  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController phoneController =
  TextEditingController();

  DateTime? checkInDate;
  DateTime? checkOutDate;

  Future<void> selectCheckInDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        checkInDate = pickedDate;
      });
    }
  }

  Future<void> selectCheckOutDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        checkOutDate = pickedDate;
      });
    }
  }

  void submitDetails() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        checkInDate == null ||
        checkOutDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please fill in all fields.",
          ),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentReservationPage(
          customerName: nameController.text,
          email: emailController.text,
          phoneNumber: phoneController.text,
          roomNumber: widget.roomNumber,
          roomType: widget.roomType,
          checkInDate: checkInDate!,
          checkOutDate: checkOutDate!,
        ),
      ),
    );
  }

  int calculateNights() {
    if (checkInDate == null || checkOutDate == null) {
      return 0;
    }

    return checkOutDate!
        .difference(checkInDate!)
        .inDays;
  }

  double calculatePrice() {
    return calculateNights() * 300;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/resort pool.jpg',
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
                  child: SingleChildScrollView(
                    child: Container(
                      width: 500,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius:
                        BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [

                          const Text(
                            "Customer Details",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 25),

                          TextField(
                            controller: nameController,
                            decoration:
                            const InputDecoration(
                              labelText: "Full Name",
                              border:
                              OutlineInputBorder(),
                            ),
                          ),

                          const SizedBox(height: 15),

                          TextField(
                            controller: emailController,
                            decoration:
                            const InputDecoration(
                              labelText: "Email",
                              border:
                              OutlineInputBorder(),
                            ),
                          ),

                          const SizedBox(height: 15),

                          TextField(
                            controller: phoneController,
                            decoration:
                            const InputDecoration(
                              labelText: "Phone Number",
                              border:
                              OutlineInputBorder(),
                            ),
                          ),

                          const SizedBox(height: 20),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed:
                              selectCheckInDate,
                              child: Text(
                                checkInDate == null
                                    ? "Select Check-In Date"
                                    : "Check-In: "
                                    "${checkInDate!.day}/${checkInDate!.month}/${checkInDate!.year}",
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed:
                              selectCheckOutDate,
                              child: Text(
                                checkOutDate == null
                                    ? "Select Check-Out Date"
                                    : "Check-Out: "
                                    "${checkOutDate!.day}/${checkOutDate!.month}/${checkOutDate!.year}",
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),

                          if (checkInDate != null &&
                              checkOutDate != null)
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.teal.shade50,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [

                                  Text(
                                    "Number of Nights: ${calculateNights()}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  Text(
                                    "Total Price: RM ${calculatePrice().toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          const SizedBox(height: 25),

                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed:
                              submitDetails,
                              child: const Text(
                                "Submit",
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