import 'package:contracts/di.dart';
import 'package:contracts/featuers/add_contract/data/request/add_contract_request.dart';
import 'package:contracts/featuers/add_contract/domain/usecase/add_contract_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contracts/featuers/add_contract/domain/mapper/mapper.dart';

import '../../../../../core/error/failuer.dart';

import '../../domain/entities/contract_material.dart';

part 'add_contract_event.dart';
part 'add_contract_state.dart';

class AddContractBloc extends Bloc<AddContractEvent, AddContractState> {
  final AddContractUseCase addContractUseCase = instance<AddContractUseCase>();
  List<AddContractMaterialModel> listRow = [];
  AddContractBloc() : super(AddContractst()) {
    on<OnOpen>((event, emit) {
      emit(LoadingState());
    });
    on<GoToTableItem>((event, emit) {
      emit(TableItemState(list: listRow));
    });

    on<GoToAddContract>((event, emit) {
      emit(AddContractst());
    });
    on<ExcuteAddContract>((event, emit) async {
      emit(LoadingState());
      Either<Failuer, bool> successOrFaliuer = await addContractUseCase.excute(
          input: AddContractRequest(
              name: projectName.text,
              executingAgency: executingAgency.text,
              watchingAgency: watchingAgency.text,
              date: _contractDate,
              startingDate: _startDate,
              finishingDate: _finishingDate,
              executionPeriod: executionPeriod.text,
              upPercent: int.parse(upPercent.text),
              downPercent: int.parse(downPercent.text),
              number: contractNum.text,
              branch: branch.text,
              content: content.text,
              price: double.parse(contractPrice.text),
              upPrice: double.parse(newPrice.text),
              materials: List.from(listRow.map((e) => e.toRequest()))));
      successOrFaliuer.fold((faliuer) {
        emit(AddContractError(message: faliuer.message));
      }, (_) {
        clearAll();

        emit(AddContractSuccess());
      });
    });
    on<GoToAddContractMaterial>((event, emit) {
      emit(AddContractMaterialState());
    });
  }
  static AddContractBloc getBloc(BuildContext context) {
    return BlocProvider.of<AddContractBloc>(context);
  }

  /// contract info

  ///1 2  3
  final TextEditingController branch = TextEditingController();
  final TextEditingController projectName = TextEditingController();
  final TextEditingController contractNum = TextEditingController();

  /// 4  5   6
  final TextEditingController executionPeriod = TextEditingController();
  final TextEditingController content = TextEditingController();

  final TextEditingController contractPrice = TextEditingController();

  /// 7 8 9
  final TextEditingController upPercent = TextEditingController(text: '0');
  final TextEditingController downPercent = TextEditingController(text: '0');
  final TextEditingController newPrice = TextEditingController(text: '0');

  /// 13 14
  final TextEditingController executingAgency = TextEditingController();
  final TextEditingController watchingAgency = TextEditingController();

  String _startDate = '';
  void setStartDate(String date) {
    _startDate = date;
  }

  String get getStartDate => _startDate;

  String _finishingDate = '';
  void setFinishingDate(String date) {
    _finishingDate = date;
  }

  String get getFinishingDate => _finishingDate;

  String _contractDate = '';
  void setContractDate(String date) {
    _contractDate = date;
  }

  String get getContractDate => _contractDate;
  ////////////
  ////
  ///material info
  final TextEditingController materialName = TextEditingController();
  final TextEditingController materialUnit = TextEditingController();
  final TextEditingController materialAmount = TextEditingController();
  final TextEditingController materialPrice = TextEditingController();
  void clearAll() {
    listRow.clear();
    projectName.clear();
    branch.clear();
    contractNum.clear();
    executingAgency.clear();
    content.clear();
    contractPrice.clear();
    upPercent.text='0';
    downPercent.text='0';
    newPrice.text='0';
    watchingAgency.clear();
    executionPeriod.clear();
  }
}
