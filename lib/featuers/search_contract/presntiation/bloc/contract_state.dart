part of 'contract_bloc.dart';

abstract class ContractState extends Equatable {
  const ContractState();

  @override
  List<Object> get props => [];
}
class LoadingState extends ContractState {}

///// Search Contract

class SearchContractInitial extends ContractState {}



class SearchContractsuccess extends ContractState {
  final ListContractsModel listContracts;
  const SearchContractsuccess({required this.listContracts});
  @override
  List<Object> get props => [listContracts];
}

class SearchContractFaield extends ContractState {
  final Failuer failuer;
  const SearchContractFaield({required this.failuer});
  @override
  List<Object> get props => [failuer];
}
///////////

//// Add Statements

class AddStatementsInitial extends ContractState {}


class AddStatementssuccess extends ContractState {
  @override
  List<Object> get props => [];
}

class AddStatementsFaield extends ContractState {
  final Failuer failuer;
  const AddStatementsFaield({required this.failuer});
  @override
  List<Object> get props => [failuer];
}

class AddStatementsMaterialInitial extends ContractState {}

class AddStatementsMaterialFaield extends ContractState {
  final String message;
  const AddStatementsMaterialFaield({required this.message});
}
///////
 

 //// Show Statement 


class GetStatementsSuccess extends ContractState {
  final ListStatementModel listStatementModel;
  const GetStatementsSuccess({required this.listStatementModel});
  @override
  List<Object> get props => [];
}

class GetStatementsFaield extends ContractState {
  final Failuer failuer;
  const GetStatementsFaield({required this.failuer});
  @override
  List<Object> get props => [failuer];
}
//////////

////// Material Table

class MaterialTableInitial extends ContractState {
  final List<MaterialModel> listRow;
  const MaterialTableInitial({required this.listRow});
}

///

/// Sub Contract

class AddSubContractInitial extends ContractState {}


class AddSubContractSuccess extends ContractState {}

class AddSubContractFaield extends ContractState {
  final Failuer failuer;
  const AddSubContractFaield({required this.failuer});
  @override
  List<Object> get props => [failuer];
}

class AddMaterialToSubContractInItial extends ContractState {}
//// contract material
class AddContractMaterialToSubContractInitial extends ContractState {}
class ExcuteAddContractMaterialToSubContract extends ContractState {}
//////


/// other material
class AddOtherMaterialToSubContractIntial extends ContractState {}
class ExcuteAddOtherMaterialToSubContract extends ContractState {}
//////





///////////