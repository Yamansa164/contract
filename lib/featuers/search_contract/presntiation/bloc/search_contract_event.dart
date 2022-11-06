part of 'search_contract_bloc.dart';

abstract class SearchContractEvent extends Equatable {
  const SearchContractEvent();

  @override
  List<Object> get props => [];
}
class GoBackToSearch extends SearchContractEvent{}
class DoSearchContractEvent extends SearchContractEvent {}
class GoToAddStatementsEvent extends SearchContractEvent {}

