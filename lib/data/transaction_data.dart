import '../models/transaction.dart';

class TransactionData {

  static List<Transaction> transactions = [

    Transaction(
      transactionId: "TRX001",
      transactionType: "Customer Payment",
      partyName: "John Smith",
      amount: "500",
    ),

    Transaction(
      transactionId: "TRX002",
      transactionType: "Food Supplier",
      partyName: "Ocean Fresh Seafood",
      amount: "1200",
    ),

    Transaction(
      transactionId: "TRX003",
      transactionType: "Laundry Service",
      partyName: "CleanPro Laundry",
      amount: "350",
    ),

    Transaction(
      transactionId: "TRX004",
      transactionType: "Maintenance",
      partyName: "Island Maintenance",
      amount: "900",
    ),
  ];
}