import 'package:flutter/material.dart';
import 'package:paymentmanagement/data/room_data.dart';

class WaterVillaPage extends StatefulWidget {
  const WaterVillaPage({super.key});

  @override
  State<WaterVillaPage> createState() =>
      _WaterVillaPageState();
}

class _WaterVillaPageState extends State<WaterVillaPage> {

  @override
  Widget build(BuildContext context) {

    List<String> rooms = RoomData.rooms.keys
        .where((room) => room.startsWith("Villa"))
        .toList();

    return Scaffold(
      body: Stack(
        children: [

          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/tree.jpg',   // Change to your image
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
                      "Water Villa",
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
                  itemCount: rooms.length,
                  itemBuilder: (context, index) {

                    String room = rooms[index];
                    bool occupied = RoomData.rooms[room]!;

                    return Card(
                      color: Colors.white.withOpacity(0.95),
                      margin: const EdgeInsets.only(bottom: 15),
                      child: ListTile(

                        leading: Icon(
                          Icons.hotel,
                          color: occupied
                              ? Colors.red
                              : Colors.green,
                        ),

                        title: Text(room),

                        subtitle: Text(
                          occupied
                              ? "Occupied"
                              : "Available",
                          style: TextStyle(
                            color: occupied
                                ? Colors.red
                                : Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        trailing: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              RoomData.rooms[room] = !occupied;
                            });
                          },
                          child: Text(
                            occupied
                                ? "Available"
                                : "Occupy",
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