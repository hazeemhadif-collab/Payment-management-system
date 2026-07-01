import 'package:flutter/material.dart';
import 'package:paymentmanagement/login_page.dart';
import 'data/reservation_data.dart';
import 'models/reservation.dart';

class ReservationGeneratePage extends StatefulWidget {
  const ReservationGeneratePage({super.key});

  @override
  State<ReservationGeneratePage> createState() =>
      _ReservationGeneratePageState();
}



class _ReservationGeneratePageState
    extends State<ReservationGeneratePage> {

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              'assets/images/resort1.webp',
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
                      "Reservation Report Print",
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
                "Customer Reservations",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Column(
                  children: [

                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: ReservationData.reservations.length,
                        itemBuilder: (context, index) {

                          Reservation reservation =
                          ReservationData.reservations[index];

                          return Card(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    reservation.customerName,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const Divider(),

                                  Text("Name: ${reservation.customerName}"),
                                  Text("Phone Number: ${reservation.phoneNumber}"),
                                  Text("Email: ${reservation.email}"),
                                  Text("Room Type: ${reservation.roomType}"),
                                  Text("Room Number: ${reservation.roomNumber}"),
                                  Text(
                                    "Check In: ${reservation.checkInDate.day}/${reservation.checkInDate.month}/${reservation.checkInDate.year}",
                                  ),
                                  Text(
                                    "Check Out: ${reservation.checkOutDate.day}/${reservation.checkOutDate.month}/${reservation.checkOutDate.year}",
                                  ),
                                  Text("Amount: RM ${reservation.paymentAmount}"),
                                  Text("Status: ${reservation.status}"),

                                  const SizedBox(height: 20),

                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton.icon(
                                      icon: const Icon(Icons.print),
                                      label: const Text("Print Report"),
                                      onPressed: () {

                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            title: const Text("Print Report"),
                                            content: const Text(
                                                "Reservation report is ready.\nSend to printer?"
                                            ),
                                            actions: [

                                              TextButton(
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Cancel"),
                                              ),

                                              ElevatedButton(
                                                onPressed: (){

                                                  Navigator.pop(context);

                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        "Reservation Report Printed Successfully",
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: const Text("Print"),
                                              ),
                                            ],
                                          ),
                                        );

                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

