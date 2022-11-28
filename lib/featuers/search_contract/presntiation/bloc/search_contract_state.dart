part of 'search_contract_bloc.dart';

abstract class SearchContractState extends Equatable {
  const SearchContractState();

  @override
  List<Object> get props => [];
}

class SearchContractInitial extends SearchContractState {}

class SearchContractLoading extends SearchContractState {}

class SearchContractsuccess extends SearchContractState {
  final ListContractsModel listContracts;
  const SearchContractsuccess({required this.listContracts});
  @override
  List<Object> get props => [listContracts];
}

class SearchContractFaield extends SearchContractState {
  final Failuer failuer;
  const SearchContractFaield({required this.failuer});
  @override
  List<Object> get props => [failuer];
}

class AddStatementsInitial extends SearchContractState {}

class AddStatementsLoading extends SearchContractState {}

class AddStatementssuccess extends SearchContractState {
  @override
  List<Object> get props => [];
}

class AddStatementsFaield extends SearchContractState {
  final Failuer failuer;
  const AddStatementsFaield({required this.failuer});
  @override
  List<Object> get props => [failuer];
}

class AddStatementsMaterialInitial extends SearchContractState {}

class AddStatementsMaterialFaield extends SearchContractState {
  final String message;
  const AddStatementsMaterialFaield({required this.message});

  
}


