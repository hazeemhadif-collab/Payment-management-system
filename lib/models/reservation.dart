class Reservation {
  String customerName;
  String email;
  String phoneNumber;
  String roomType;
  String roomNumber;
  String paymentAmount;
  String status;

  DateTime checkInDate;
  DateTime checkOutDate;

  Reservation({
    required this.customerName,
    required this.email,
    required this.phoneNumber,
    required this.roomType,
    required this.roomNumber,
    required this.paymentAmount,
    this.status = "Reserved",
    required this.checkInDate,
    required this.checkOutDate,
  });
}