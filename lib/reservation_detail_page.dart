import 'package:flutter/material.dart';
import 'package:paymentmanagement/data/room_data.dart';
import 'package:paymentmanagement/login_page.dart';
import 'package:paymentmanagement/reservation_generate_page.dart';
import 'data/reservation_data.dart';
import 'models/reservation.dart';

class ReservationDetailPage extends StatefulWidget {
  const ReservationDetailPage({super.key});

  @override
  State<ReservationDetailPage> createState() =>
      _ReservationDetailPageState();
}

class _ReservationDetailPageState
    extends State<ReservationDetailPage> {

  void editReservation(Reservation reservation) {

    TextEditingController nameController =
    TextEditingController(
      text: reservation.customerName,
    );

    TextEditingController emailController =
    TextEditingController(
      text: reservation.email,
    );

    TextEditingController phoneController =
    TextEditingController(
      text: reservation.phoneNumber,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Edit Reservation",
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                TextField(
                  controller: nameController,
                  decoration:
                  const InputDecoration(
                    labelText: "Customer Name",
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: emailController,
                  decoration:
                  const InputDecoration(
                    labelText: "Email",
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: phoneController,
                  decoration:
                  const InputDecoration(
                    labelText: "Phone Number",
                  ),
                ),
              ],
            ),
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

                int index =
                ReservationData.reservations
                    .indexOf(reservation);

                ReservationData.reservations[
                index] = Reservation(
                  customerName:
                  nameController.text,
                  email: emailController.text,
                  phoneNumber:
                  phoneController.text,
                  roomType:
                  reservation.roomType,
                  roomNumber:
                  reservation.roomNumber,
                  paymentAmount:
                  reservation.paymentAmount,
                  checkInDate:
                  reservation.checkInDate,
                  checkOutDate: reservation.checkOutDate,
                  status: reservation.status,
                );

                setState(() {});

                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Changes Saved Successfully",
                    ),
                  ),
                );
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    int totalRooms = RoomData.rooms.length;

    int occupiedRooms = RoomData.rooms.values
        .where((occupied) => occupied)
        .length;

    double occupancyRate =
        (occupiedRooms / totalRooms) * 100;

    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              'assets/images/pool.jpg',
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
                      "Reservation Details",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Reservation Records",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [

                    Text(
                      "Occupancy Statistics",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Total Rooms: $totalRooms",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    Text(
                      "Occupied Rooms: $occupiedRooms",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    Text(
                      "Occupancy Rate: ${occupancyRate.toStringAsFixed(1)}%",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.print),
                          label: const Text(
                            "Generate Monthly Reservation Report",
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const ReservationGeneratePage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    Expanded(
                      child: ReservationData.reservations.isEmpty
                          ? const Center(
                        child: Text(
                          "No Reservations",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      )
                          : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: ReservationData.reservations.length,
                        itemBuilder: (context, index) {

                          Reservation reservation =
                          ReservationData.reservations[index];

                          return Card(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: ListTile(
                              title: Text(reservation.customerName),

                              subtitle: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [

                                  Text(reservation.email),
                                  Text(reservation.phoneNumber),
                                  Text(reservation.roomType),
                                  Text(reservation.roomNumber),
                                  Text("RM ${reservation.paymentAmount}"),

                                ],
                              ),

                              trailing: ElevatedButton(
                                onPressed: () {
                                  editReservation(reservation);
                                },
                                child: const Text("Edit"),
                              ),
                            ),
                          );
                        },
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