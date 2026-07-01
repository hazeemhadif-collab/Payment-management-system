class PaymentReport {
  final String customerName;
  final String email;
  final String roomType;
  final String roomNumber;
  final String bankType;
  final String accountNumber;
  final String amount;

  PaymentReport({
    required this.customerName,
    required this.email,
    required this.roomType,
    required this.roomNumber,
    required this.bankType,
    required this.accountNumber,
    required this.amount,
  });
}