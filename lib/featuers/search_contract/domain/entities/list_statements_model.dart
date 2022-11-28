class ListStatementModel {
 final List<StatementModel> listStatement;
  ListStatementModel({required this.listStatement});
}

class StatementModel {
  final int id;
  final String date;
  final int overallPrice;
  final int newPrice;
  final int discount;
  final int executingAgencyPrice;
  final int discountOfExecutingAgencyPrice;
  final int executingAgencyPriceAfterDiscount;

  StatementModel(
      {required this.id,
      required this.date,
      required this.overallPrice,
      required this.newPrice,
      required this.discount,
      required this.executingAgencyPrice,
      required this.discountOfExecutingAgencyPrice,
      required this.executingAgencyPriceAfterDiscount});
}
