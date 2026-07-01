import 'package:flutter/material.dart';
import 'package:paymentmanagement/login_page.dart';
import 'package:paymentmanagement/customer_detail_page.dart';
import 'package:paymentmanagement/data/room_data.dart';
import 'customer_page.dart';
import 'room_type_page.dart';
import 'activity_page.dart';



class RoomReservationPage extends StatelessWidget {
  final String roomType;

  const RoomReservationPage({
    super.key,
    required this.roomType,
  });

  List<String> getRooms() {
    if (roomType == "Beach Room") {
      return [
        "Beach-101",
        "Beach-102",
        "Beach-103",
        "Beach-104",
        "Beach-105",
      ];
    }

    if (roomType == "Sandy Room") {
      return [
        "Sandy-201",
        "Sandy-202",
        "Sandy-203",
        "Sandy-204",
        "Sandy-205",
      ];
    }

    return [
      "Villa-301",
      "Villa-302",
      "Villa-303",
      "Villa-304",
      "Villa-305",
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<String> rooms = getRooms();

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
                decoration: const BoxDecoration(
                  color: Color(0xFF0D8B94),
                ),
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
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const CustomerPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Home",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const RoomTypePage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Room",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const ActivityPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Activities",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Text(
                "$roomType Available Rooms",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 30),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  itemCount: rooms.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color:
                      Colors.white.withOpacity(0.95),
                      margin:
                      const EdgeInsets.only(bottom: 20),
                      child: ListTile(
                        leading: const Icon(
                          Icons.hotel,
                          size: 40,
                          color: Colors.teal,
                        ),
                        title: Text(
                          rooms[index],
                        ),

                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "RM 300 per night",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),

                            Text(
                              RoomData.rooms[rooms[index]] == true
                                  ? "Occupied"
                                  : "Available",
                              style: TextStyle(
                                color: RoomData.rooms[rooms[index]] == true
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: RoomData.rooms[rooms[index]] == true
                              ? null
                              : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                CustomerDetailPage(
                                  roomType: roomType,
                                  roomNumber: rooms[index],
                                ),
                              ),
                            );
                          },
                          child: Text(
                            RoomData.rooms[rooms[index]] == true
                                ? "Occupied"
                                : "Select",
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