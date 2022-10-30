part of 'search_contract_bloc.dart';

abstract class SearchContractState extends Equatable {
  const SearchContractState();
  
  @override
  List<Object> get props => [];
}

class SearchContractInitial extends SearchContractState {}
