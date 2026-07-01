import 'package:flutter/material.dart';
import 'package:paymentmanagement/data/reservation_data.dart';
import 'package:paymentmanagement/data/room_data.dart';
import 'package:paymentmanagement/models/reservation.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {

  void checkInGuest(Reservation reservation) {

    setState(() {

      reservation.status = "Checked In";

      RoomData.rooms[
      reservation.roomNumber
      ] = true;

    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "${reservation.customerName} checked in successfully",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/resort1.webp', // Your background image
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
                color: const Color(0xFF0D8B94),
                child: Row(
                  children: [

                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),

                    const SizedBox(width: 10),

                    const Text(
                      "Immediate Check-In",
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

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: ReservationData.reservations.length,
                  itemBuilder: (context, index) {

                    Reservation reservation =
                    ReservationData.reservations[index];

                    return Card(
                      color: Colors.white.withOpacity(0.95),
                      margin: const EdgeInsets.only(bottom: 15),
                      child: ListTile(

                        leading: const Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.teal,
                        ),

                        title: Text(
                          reservation.customerName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        subtitle: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [

                            Text("Room: ${reservation.roomNumber}"),

                            Text("Type: ${reservation.roomType}"),

                            Text(
                              "Status: ${reservation.status}",
                              style: TextStyle(
                                color: reservation.status == "Checked In"
                                    ? Colors.green
                                    : Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        trailing: ElevatedButton(
                          onPressed: reservation.status == "Checked In"
                              ? null
                              : () {
                            checkInGuest(reservation);
                          },
                          child: const Text("Check In"),
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