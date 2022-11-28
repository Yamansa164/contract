import 'package:contracts/di.dart';
import 'package:contracts/featuers/search_contract/data/request/add_statements.dart';
import 'package:contracts/featuers/search_contract/data/response/statement.dart';
import 'package:contracts/featuers/search_contract/domain/entities/list_statements_model.dart';
import 'package:contracts/featuers/search_contract/domain/usecase/add_statements.dart';
import 'package:contracts/featuers/search_contract/domain/usecase/search_contract.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failuer.dart';
import '../../domain/entities/list_contract_model.dart';
import '../../domain/usecase/get_statements.dart';

part 'contract_event.dart';
part 'contract_state.dart';

class ContractBloc extends Bloc<ContractEvent, ContractState> {
  SearchContractUseCase searchContractUseCase =
      instance<SearchContractUseCase>();
  GetStatementsUseCase getStatementsUseCase = instance<GetStatementsUseCase>();
  AddStatementsUseCase addStatementsUseCase = instance<AddStatementsUseCase>();
  ContractBloc() : super(SearchContractInitial()) {
    /// search
    on<DoSearchContractEvent>((event, emit) async {
      emit(LoadingState());
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
    ////
    ///  Statement
    on<GoToAddStatementsEvent>((event, emit) {
      print(listContractsModel!.contract
          .map((e) => e.listMaterial.map((e) => e.name)));
      emit(AddStatementsInitial());
    });
    on<GoToAddStatementsMaterialEvent>((event, emit) {
      emit(AddStatementsMaterialInitial());
    });
    on<MaterialAmountFaieldEvent>((event, emit) {
      emit(AddStatementsMaterialFaield(message: event.message));
    });
    on<ExcuteAddStatementsEvent>((event, emit) async {
      emit(LoadingState());
      List<StatementMaterials> listStatementMaterial = [];
      List.generate(
          listContractMaterialModel.length,
          (index) => listStatementMaterial.add(StatementMaterials(
              materialId: listContractMaterialModel[index].id,
              quantity: listContractMaterialModel[index].newAmount)));
      Either<Failuer, bool> successOrFailuer =
          await addStatementsUseCase.excute(
              input: AddStatementInput(
                  contractId: contractsModel!.id,
                  addStatementRequest: AddStatementRequest(
                      discount: discount.text,
                      date: statementDate.text,
                      materials: listStatementMaterial)));
      successOrFailuer
          .fold((faliuer) => emit(AddStatementsFaield(failuer: faliuer)), (_) {
        emit(AddStatementssuccess());
        listContractMaterialModel.clear();
      });
    });
    on<DoGetStatements>((event, emit) async {
      emit(LoadingState());
      Either<Failuer, ListStatementModel> successOrFailuer =
          await getStatementsUseCase.excute(input: event.contractId);
      successOrFailuer.fold(
          (faliuer) => emit(GetStatementsFaield(failuer: faliuer)),
          (listStatements) =>
              emit(GetStatementsSuccess(listStatementModel: listStatements)));
    });
    ////
    /// Material Table
    on<GoToShowMaterialTableEvenet>((event, emit) {
      emit(MaterialTableInitial(listRow: event.listRow));
    });

    /// Sub Contract

    on<GoToAddSubContractinitial>((event, emit) async {
      emit(AddSubContractInitial());
    });
    on<GoToAddMaterialToSubContract>((event, emit) async {
      emit(AddMaterialToSubContractInItial());
    });
    // contract material
    on<GoToAddContractMaterialToSubContract>((event, emit) async {
      emit(AddContractMaterialToSubContractInitial());
    });
    ////
    // Other material
    on<GoToAddOtherMaterialToSubContract>((event, emit) async {
      emit(AddOtherMaterialToSubContractIntial());
    });
    ////
  }
  static ContractBloc getBloc(BuildContext context) {
    return BlocProvider.of<ContractBloc>(context);
  }

  /// search for contract
  final TextEditingController branch = TextEditingController();
  final TextEditingController contractNum = TextEditingController();
  final TextEditingController executingAgency = TextEditingController();
  ////

  ///  statements
  final TextEditingController materialAmountForStatemets = TextEditingController();
  final TextEditingController discount = TextEditingController(text: '0');
  final TextEditingController statementDate = TextEditingController();

  int _selectedMaterial = 0;
  int get getSelectedMaterial => _selectedMaterial;
  void setSelectedMaterial(String number) {
    _selectedMaterial = int.parse(number) - 1;
  }

  int _maxAmount = 0;
  int get getMaxAmount => _maxAmount;
  void setMaxAmount(int amount) {
    _maxAmount = amount;
  }
  //////

  /// sub contract
  final TextEditingController executingDate = TextEditingController();
  final TextEditingController agreeNumber = TextEditingController();
  final TextEditingController agreeDate = TextEditingController();
  final TextEditingController subContractNumber = TextEditingController();
  final TextEditingController subContractSubject = TextEditingController();

  ///
  /// Add New Material 
   final TextEditingController materialName = TextEditingController();
  final TextEditingController materialUnit = TextEditingController();
  final TextEditingController materialAmount = TextEditingController();
  final TextEditingController materialPrice = TextEditingController();
  /// 

  ListContractsModel? listContractsModel;
  ListStatementModel? listStatementModel;
  ContractsModel? contractsModel;
  List<MaterialModel> listContractMaterialModel = [];
  List<MaterialModel> listOtherMaterialModel =[];
}
