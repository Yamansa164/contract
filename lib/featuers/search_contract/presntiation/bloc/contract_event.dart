part of 'contract_bloc.dart';

abstract class ContractEvent extends Equatable {
  const ContractEvent();

  @override
  List<Object> get props => [];
}

class GoBackToSearch extends ContractEvent {}

/// search Contract
class DoSearchContractEvent extends ContractEvent {}

////
///
/// Material Table
class GoToShowMaterialTableEvenet extends ContractEvent {
  final List<MaterialModel> listRow;

  const GoToShowMaterialTableEvenet({required this.listRow});
}

///

/// Statements
class GoToAddStatementsEvent extends ContractEvent {}

class ExcuteAddStatementsEvent extends ContractEvent {}

class GoToAddStatementsMaterialEvent extends ContractEvent {}

class MaterialAmountFaieldEvent extends ContractEvent {
  final String message;
  const MaterialAmountFaieldEvent({required this.message});
}

class DoGetStatements extends ContractEvent {
  final int contractId;

  const DoGetStatements({required this.contractId});
}

/////  sub contract
class GoToAddSubContractinitial extends ContractEvent {}

class GoToAddMaterialToSubContract extends ContractEvent {}

class GoToAddContractMaterialToSubContract extends ContractEvent {}

class GoToAddOtherMaterialToSubContract extends ContractEvent {}

class ExcuteAddSubContract extends ContractEvent {}
