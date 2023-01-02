
class ListContractsModel {
  List<ContractsModel> contract;
  ListContractsModel({required this.contract});
}

class ContractsModel {
  final int id;
  final String branch;
  final String contractNum;
  final String executingAgency;
  final String starteDate;
  final List<MaterialModel> listMaterial;

  ContractsModel(
      {required this.id,
      required this.listMaterial,
      required this.branch,
      required this.contractNum,
      required this.executingAgency,
      required this.starteDate});
}

class MaterialModel {
  final int id;
  final String number;
  final String name;
  final String unit;
  final int quantity;
  final String notUsedQuantity;
  final String subContractNumber;
  int newQuantity ;
  int quarterPercent;
  final double individualPrice;

  MaterialModel(
      {required this.id,
      required this.notUsedQuantity,
      required this.number,
      required this.name,
      required this.quantity,
      required this.unit,
      required this.individualPrice,
      required this.subContractNumber,
      this.newQuantity=0,
      this.quarterPercent=0
      });
}
