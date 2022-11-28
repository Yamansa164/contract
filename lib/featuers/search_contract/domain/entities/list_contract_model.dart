import 'package:flutter/material.dart';

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
  final int number;
  final String name;
  final String unit;
  final int amount;
  int newAmount ;
  final double individualPrice;
  // final TextEditingController statementsAmount = TextEditingController();

  MaterialModel(
      {required this.id,
      required this.number,
      required this.name,
      required this.amount,
      required this.unit,
      required this.individualPrice,
      this.newAmount=0});
}
