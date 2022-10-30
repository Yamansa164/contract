class ContractMaterialModel {
  final int num;

  final String name;
  final String unit;
  final int amount;
  final double individualPrice;
  final double overallPrice;

  ContractMaterialModel(
      {required this.num,
      required this.name,
      required this.unit,
      required this.amount,
      required this.individualPrice,
      required this.overallPrice});
}
