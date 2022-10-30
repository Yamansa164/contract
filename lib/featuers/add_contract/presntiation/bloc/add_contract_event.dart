part of 'add_contract_bloc.dart';

@immutable
abstract class AddContractEvent {}

class OnOpen extends AddContractEvent {}

class GoToAddContract extends AddContractEvent {}

class GoToTableItem extends AddContractEvent {}

class GoToAddContractMaterial extends AddContractEvent {}

class ExcuteAddContract extends AddContractEvent {}
