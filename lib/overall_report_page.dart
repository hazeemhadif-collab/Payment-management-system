import 'package:flutter/material.dart';
import 'package:paymentmanagement/data/reservation_data.dart';
import 'package:paymentmanagement/data/room_data.dart';

class OverallReportPage extends StatelessWidget {
  const OverallReportPage({super.key});

  @override
  Widget build(BuildContext context) {

    int totalReservations = ReservationData.reservations.length;

    int totalRooms = RoomData.rooms.length;

    int occupiedRooms =
        RoomData.rooms.values.where((room) => room).length;

    int checkedIn =
        ReservationData.reservations
            .where((r) => r.status == "Checked In")
            .length;

    int reserved =
        ReservationData.reservations
            .where((r) => r.status == "Reserved")
            .length;

    double occupancyRate =
        (occupiedRooms / totalRooms) * 100;

    double totalRevenue = 0;

    for (var reservation in ReservationData.reservations) {
      totalRevenue +=
          double.tryParse(reservation.paymentAmount) ?? 0;
    }

    Map<String, int> roomCount = {};

    for (var reservation in ReservationData.reservations) {
      roomCount.update(
        reservation.roomType,
            (value) => value + 1,
        ifAbsent: () => 1,
      );
    }

    Map<String, int> roomNumberCount = {};

    for (var reservation in ReservationData.reservations) {

      roomNumberCount.update(
        reservation.roomNumber,
            (value) => value + 1,
        ifAbsent: () => 1,
      );

    }

    List<MapEntry<String, int>> sortedRoomTypes =
    roomCount.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));


    List<MapEntry<String, int>> sortedRooms =
    roomNumberCount.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));


    return Scaffold(
      appBar: AppBar(
        title: const Text("Overall Monthly Report"),
        backgroundColor: const Color(0xFF0D8B94),
      ),

      body: Stack(
        children: [

          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/resort1.webp', // Your background image
              fit: BoxFit.cover,
            ),
          ),

          // Dark overlay (optional, makes text easier to read)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.25),
            ),
          ),

          // Main content
          ListView(
            padding: const EdgeInsets.all(20),
            children: [

              Card(
                child: ListTile(
                  title: const Text("Total Reservations"),
                  trailing: Text("$totalReservations"),
                ),
              ),

              Card(
                child: ListTile(
                  title: const Text("Checked In"),
                  trailing: Text("$checkedIn"),
                ),
              ),

              Card(
                child: ListTile(
                  title: const Text("Reserved"),
                  trailing: Text("$reserved"),
                ),
              ),

              Card(
                child: ListTile(
                  title: const Text("Revenue"),
                  trailing: Text(
                    "RM ${totalRevenue.toStringAsFixed(2)}",
                  ),
                ),
              ),

              Card(
                child: ListTile(
                  title: const Text("Occupancy Rate"),
                  trailing: Text(
                    "${occupancyRate.toStringAsFixed(1)}%",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Room Type Popularity",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              ...sortedRoomTypes.map(
                    (entry) => Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    title: Text(entry.key),
                    trailing: Text("${entry.value} reservations"),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Most Reserved Rooms",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              ...sortedRooms.map(
                    (entry) => Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.hotel,
                      color: Colors.teal,
                    ),
                    title: Text(entry.key),
                    trailing: Text("${entry.value} bookings"),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                icon: const Icon(Icons.print),
                label: const Text("Print Overall Report"),
                onPressed: () {

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(

                      title: const Text(
                        "Print Overall Report",
                      ),

                      content: const Text(
                        "Overall Monthly Report is ready.\nSend to printer?",
                      ),

                      actions: [

                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),

                        ElevatedButton(
                          onPressed: () {

                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Overall Monthly Report Printed Successfully",
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
            ],
          ),
        ],
      ),
    );
  }
}