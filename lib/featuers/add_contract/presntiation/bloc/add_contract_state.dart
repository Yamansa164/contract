part of 'add_contract_bloc.dart';

@immutable
abstract class AddContractState extends Equatable {}

class LoadingState extends AddContractState {
  @override
  List<Object?> get props => [];
}

class AddContractst extends AddContractState {
  @override

  List<Object?> get props => [];
}

class AddContractSuccess extends AddContractState {
  @override
  List<Object?> get props => [];
}

class AddContractError extends AddContractState {
String message;
AddContractError({required this.message});
  @override
  List<Object?> get props => [message];
}

class TableItemState extends AddContractState {
  List<ContractMaterialModel> list;
  TableItemState({required this.list});
  @override
  List<Object?> get props => [list];
}

class AddContractMaterialState extends AddContractState {
  @override
  List<Object?> get props => [];
}

