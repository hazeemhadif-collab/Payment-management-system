import 'package:flutter/material.dart';
import 'package:paymentmanagement/data/reservation_data.dart';
import 'package:paymentmanagement/login_page.dart';
import 'package:paymentmanagement/manager_page.dart';
import 'package:paymentmanagement/models/reservation.dart';

class ManagerCustomerFilterPage extends StatefulWidget {
  const ManagerCustomerFilterPage({super.key});

  @override
  State<ManagerCustomerFilterPage> createState() =>
      _ManagerCustomerFilterPageState();
}

class _ManagerCustomerFilterPageState
    extends State<ManagerCustomerFilterPage> {

  String selectedRoomType = "All";
  String occupancyFilter = "All";
  String searchText = "";

  @override
  Widget build(BuildContext context) {

    List<Reservation> filteredList =
    ReservationData.reservations.where((r) {

      bool roomMatch =
          selectedRoomType == "All" ||
              r.roomType == selectedRoomType;

      bool nameMatch =
      r.customerName
          .toLowerCase()
          .contains(searchText.toLowerCase());

      bool statusMatch =
          occupancyFilter == "All" ||
              r.status == occupancyFilter;

      return roomMatch && nameMatch && statusMatch;

    }).toList();

    return Scaffold(
      body: Stack(
        children: [

          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/resort bridge.jpg',
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: const Color(0xFF0D8B94),
                child: SafeArea(
                  child: Row(
                    children: [

                      // Back Arrow
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),

                      Image.asset(
                        'assets/images/danai logo.png',
                        width: 55,
                      ),

                      const SizedBox(width: 10),

                      const Text(
                        "Customer Filter",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Center(
                  child: Container(
                    width: 900,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius:
                      BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [

                        // Search
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "Search Customer",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              searchText = value;
                            });
                          },
                        ),

                        const SizedBox(height: 15),

                        // Room Type
                        DropdownButtonFormField<String>(
                          value: selectedRoomType,
                          decoration: const InputDecoration(
                            labelText: "Room Type",
                            border: OutlineInputBorder(),
                          ),
                          items: const [

                            DropdownMenuItem(
                              value: "All",
                              child: Text("All Rooms"),
                            ),

                            DropdownMenuItem(
                              value: "Beach Room",
                              child: Text("Beach Room"),
                            ),

                            DropdownMenuItem(
                              value: "Sandy Room",
                              child: Text("Sandy Room"),
                            ),

                            DropdownMenuItem(
                              value: "Villa",
                              child: Text("Water Villa"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedRoomType = value!;
                            });
                          },
                        ),

                        const SizedBox(height: 15),

                        // Status
                        DropdownButtonFormField<String>(
                          value: occupancyFilter,
                          decoration: const InputDecoration(
                            labelText: "Reservation Status",
                            border: OutlineInputBorder(),
                          ),
                          items: const [

                            DropdownMenuItem(
                              value: "All",
                              child: Text("All"),
                            ),

                            DropdownMenuItem(
                              value: "Reserved",
                              child: Text("Reserved"),
                            ),

                            DropdownMenuItem(
                              value: "Checked In",
                              child: Text("Checked In"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              occupancyFilter = value!;
                            });
                          },
                        ),

                        const SizedBox(height: 20),

                        Expanded(
                          child: ListView.builder(
                            itemCount: filteredList.length,
                            itemBuilder: (context, index) {

                              Reservation reservation =
                              filteredList[index];

                              return Card(
                                margin:
                                const EdgeInsets.only(bottom: 10),
                                child: ListTile(

                                  leading: const Icon(
                                    Icons.person,
                                    color: Colors.teal,
                                  ),

                                  title: Text(
                                    reservation.customerName,
                                  ),

                                  subtitle: Text(
                                    "${reservation.roomType} • ${reservation.roomNumber}\nStatus: ${reservation.status}",
                                  ),

                                ),
                              );
                            },
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