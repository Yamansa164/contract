import 'package:bloc/bloc.dart';
import 'package:contracts/di.dart';
import 'package:contracts/featuers/add_contract/presntiation/bloc/add_contract_bloc.dart';
import 'package:contracts/featuers/search_contract/domain/usecase/search_contract.dart';
import 'package:contracts/featuers/search_contract/presntiation/page/search_contract_page.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failuer.dart';
import '../../domain/entities/list_contract_model.dart';

part 'search_contract_event.dart';
part 'search_contract_state.dart';

class SearchContractBloc
    extends Bloc<SearchContractEvent, SearchContractState> {
  SearchContractUseCase searchContractUseCase =
      instance<SearchContractUseCase>();
  SearchContractBloc() : super(SearchContractInitial()) {
    on<DoSearchContractEvent>((event, emit) async {
      emit(SearchContractLoading());
      Either<Failuer, ListContractsModel> successOrFailuer =
          await searchContractUseCase.excute(
              input: SearchInput(
                  number: contractNum.text,
                  branch: branch.text,
                  executingAgency: executingAgency.text));
      successOrFailuer.fold(
          (faliuer) => emit(SearchContractFaield(failuer: faliuer)),
          (listContract) =>
              emit(SearchContractsuccess(listContracts: listContract)));
    });
    on<GoBackToSearch>((event, emit) {
      emit(SearchContractInitial());
    });
    on<GoToAddStatementsEvent>((event, emit) {
      print(listContractsModel!.contract.map((e) => e.listMaterial.map((e) => e.name)));
      emit(AddStatementsInitial());
    });
  }
  static SearchContractBloc getBloc(BuildContext context) {
    return BlocProvider.of<SearchContractBloc>(context);
  }

  final TextEditingController branch = TextEditingController();
  final TextEditingController contractNum = TextEditingController();
  final TextEditingController executingAgency = TextEditingController();

  String _statementDate = '';
  String get getStatementDate => _statementDate;
  void setStatementDate(String date) {
    _statementDate = date;
  }

  ListContractsModel? listContractsModel;
  ContractsModel? contractsModel;
}