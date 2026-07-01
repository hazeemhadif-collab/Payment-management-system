import 'package:flutter/material.dart';
import 'package:paymentmanagement/beach_room_page.dart';
import 'package:paymentmanagement/data/room_data.dart';
import 'package:paymentmanagement/sandy_room_page.dart';
import 'package:paymentmanagement/water_villa_page.dart';

class RoomAvailabilityPage extends StatefulWidget {
  const RoomAvailabilityPage({super.key});

  @override
  State<RoomAvailabilityPage> createState() =>
      _RoomAvailabilityPageState();
}

class _RoomAvailabilityPageState
    extends State<RoomAvailabilityPage> {

  void occupyRoom(String room) {
    setState(() {
      RoomData.rooms[room] = true;
    });
  }

  void availableRoom(String room) {
    setState(() {
      RoomData.rooms[room] = false;
    });
  }

  @override
  Widget build(BuildContext context) {


    Widget buildRoomCard(
        BuildContext context,
        String title,
        String subtitle,
        IconData icon,
        Widget page,
        ) {
      return Card(
        elevation: 8,
        child: ListTile(
          leading: Icon(
            icon,
            size: 50,
            color: Colors.teal,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(subtitle),
          trailing: ElevatedButton(
            child: const Text("View"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => page,
                ),
              );
            },
          ),
        ),
      );
    }

    List<String> roomList =
    RoomData.rooms.keys.toList();

    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              'assets/images/tree.jpg',
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
                color: const Color(0xFF0D8B94),
                child: const Center(
                  child: Text(
                    "Room Availability",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [

                      buildRoomCard(
                        context,
                        "Beach Room",
                        "Manage all Beach Rooms",
                        Icons.beach_access,
                        const BeachRoomPage(),
                      ),

                      const SizedBox(height: 20),

                      buildRoomCard(
                        context,
                        "Sandy Room",
                        "Manage all Sandy Rooms",
                        Icons.landscape,
                        const SandyRoomPage(),
                      ),

                      const SizedBox(height: 20),

                      buildRoomCard(
                        context,
                        "Water Villa",
                        "Manage all Water Villas",
                        Icons.water,
                        const WaterVillaPage(),
                      ),
                    ],
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