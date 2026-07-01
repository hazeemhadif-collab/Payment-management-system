class HotelStatistics {
  static double totalRevenue = 0;
  static double totalCost = 0;

  static double get totalProfit =>
      totalRevenue - totalCost;

  static double get occupancyRate =>
      75.0;
}