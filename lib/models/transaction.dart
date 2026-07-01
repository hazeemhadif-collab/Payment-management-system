class Transaction {
  final String transactionId;
  final String transactionType;
  final String partyName;
  final String amount;
  String status;

  Transaction({
    required this.transactionId,
    required this.transactionType,
    required this.partyName,
    required this.amount,
    this.status = "Pending",
  });
}