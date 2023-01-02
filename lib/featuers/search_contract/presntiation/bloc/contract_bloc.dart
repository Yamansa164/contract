import 'package:contracts/di.dart';
import 'package:contracts/featuers/add_contract/data/request/add_contract_request.dart';
import 'package:contracts/featuers/add_contract/domain/usecase/add_contract_usecase.dart';
import 'package:contracts/featuers/search_contract/data/request/add_statements.dart';
import 'package:contracts/featuers/search_contract/data/request/add_sub_contract.dart';
import 'package:contracts/featuers/search_contract/data/response/statement.dart';
import 'package:contracts/featuers/search_contract/domain/entities/list_statements_model.dart';
import 'package:contracts/featuers/search_contract/domain/usecase/add_statements.dart';
import 'package:contracts/featuers/search_contract/domain/usecase/add_sub_contract.dart';
import 'package:contracts/featuers/search_contract/domain/usecase/search_contract.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failuer.dart';
import '../../domain/entities/list_contract_model.dart';
import '../../domain/usecase/get_statements.dart';
import '../widget/quarter/select_material_toquarter.dart';

part 'contract_event.dart';
part 'contract_state.dart';

class ContractBloc extends Bloc<ContractEvent, ContractState> {
  SearchContractUseCase searchContractUseCase =
      instance<SearchContractUseCase>();
  GetStatementsUseCase getStatementsUseCase = instance<GetStatementsUseCase>();
  AddStatementsUseCase addStatementsUseCase = instance<AddStatementsUseCase>();
  AddSubContractUseCase addSubContractUseCase =
      instance<AddSubContractUseCase>();
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
      List<StatementMaterialsRequest> listStatementMaterial = [];
      List.generate(
          listContractMaterialToAddToStatement.length,
          (index) => listStatementMaterial.add(StatementMaterialsRequest(
              materialId: listContractMaterialToAddToStatement[index].id,
              quantity:
                  listContractMaterialToAddToStatement[index].newQuantity)));
      Either<Failuer, bool> successOrFailuer =
          await addStatementsUseCase.excute(
              input: AddStatementInput(
                  contractId: contractsModel!.id,
                  addStatementRequest: AddStatementRequest(
                      discount: discountToStatment.text,
                      date: dateToStatment.text,
                      materials: listStatementMaterial)));
      successOrFailuer
          .fold((faliuer) => emit(AddStatementsFaield(failuer: faliuer)), (_) {
        emit(AddStatementssuccess());
        listContractMaterialToAddToStatement.clear();
        dateToStatment.clear();
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
    // on<GoToAddContractMaterialToSubContract>((event, emit) async {
    //   emit(AddContractMaterialToSubContractInitial());
    // });
    ////
    // Other material
    on<GoToAddOtherMaterialToSubContract>((event, emit) async {
      emit(AddOtherMaterialToSubContractIntial());
    });
    on<ExcuteAddSubContract>((event, emit) async {
      emit(LoadingState());
      Either<Failuer, bool> successOrFailuer =
          await addSubContractUseCase.excute(
              input: AddSubContractInput(
        addSubContractRequest: AddSubContractRequest(
            startingDate: staritngDateToSubContract.text,
            agreementDate: agreeDateToSubContract.text,
            agreementNumber: agreeNumberToSubContract.text,
            number: numberToSubContract.text,
            subject: subjectToSubContract.text,
            contractMaterials: listContractMaterialToAddToSubContract,
            otherMaterials: listOtherMaterialToAddToSubContract),
        contractId: contractsModel!.id,
      ));
      successOrFailuer
          .fold((faliuer) => emit(AddSubContractFaield(failuer: faliuer)), (_) {
        emit(AddSubContractSuccess());
        subContractClear();
      });
    });
    //// quarter
    on<GoToAddQuarterEvent>((event, emit) {
      emit(AddQuarterInitial());
    });
    on<GoToAddQuarterMaterialEvent>((event, emit) {
      emit(AddQuarterMaterialInitial());
    });
    
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
  final TextEditingController materialAmountToStatemets =
      TextEditingController();
  final TextEditingController discountToStatment =
      TextEditingController(text: '0');
  final TextEditingController dateToStatment = TextEditingController();
  List<MaterialModel> listContractMaterialToAddToStatement = [];

  int _selectedMaterial = 0;
  int get getSelectedMaterial => _selectedMaterial;
  void setSelectedMaterial(String number) {
    _selectedMaterial = int.parse(number);
  }

  int _maxAmount = 0;
  int get getMaxAmount => _maxAmount;
  void setMaxAmount(int amount) {
    _maxAmount = amount;
  }

  /// Add New Material To Statement
  final TextEditingController otherMaterialName = TextEditingController();
  final TextEditingController otherMaterialUnit = TextEditingController();
  final TextEditingController otherMaterialAmount = TextEditingController();
  final TextEditingController otherMaterialPrice = TextEditingController();

  ///
  ///
  //////

  /// sub contract
  final TextEditingController staritngDateToSubContract =
      TextEditingController();
  final TextEditingController agreeNumberToSubContract =
      TextEditingController();
  final TextEditingController agreeDateToSubContract = TextEditingController();
  final TextEditingController numberToSubContract = TextEditingController();
  final TextEditingController subjectToSubContract = TextEditingController();
  final TextEditingController contractmaterialAmountToSubContract =
      TextEditingController();
  List<ContractMaterialsRequestToSubContract>
      listContractMaterialToAddToSubContract = [];
  List<OtherMaterialsRequestToSubContract> listOtherMaterialToAddToSubContract =
      [];

  List<MaterialModel> listMaterialToAddToSubContract = [];

  ///

  ListContractsModel? listContractsModel;
  ListStatementModel? listStatementModel;
  ContractsModel? contractsModel;
  // List<MaterialModel> listOtherMaterialModel =[];

  void subContractClear() {
    listContractMaterialToAddToSubContract.clear();
    listOtherMaterialToAddToSubContract.clear();
    listMaterialToAddToSubContract.clear();
    subjectToSubContract.clear();
    numberToSubContract.clear();
    agreeNumberToSubContract.clear();
    agreeDateToSubContract.clear();
    staritngDateToSubContract.clear();
  }

  ///////////// quarter
  final TextEditingController quarterPercent = TextEditingController();
    final TextEditingController quarterNum = TextEditingController();

  List<MaterialModel> listMaterialToAddToQuarter = [];
}
