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
        date: contractDate.text,
        startingDate: startDate.text,
        finishingDate: finishDate.text,
        executionPeriod: executionPeriod.text,
        upPercent: int.parse(upPercent.text),
        downPercent: int.parse(downPercent.text),
        number: contractNum.text,
        stoppingsPercent: int.parse(stopping.text),
        branch: branch.text,
        content: 's',
        materials: List<ContractMaterialsRequest>.from(
            listRow.map((e) => e.toRequest())),
      ));
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
  final TextEditingController addressName = TextEditingController();
  final TextEditingController contractNum = TextEditingController();

  /// 4  5   6
  final TextEditingController executionPeriod = TextEditingController();
  final TextEditingController projectName = TextEditingController();

  final TextEditingController stopping = TextEditingController();

  /// 7 8 9
  final TextEditingController upPercent = TextEditingController(text: '0');
  final TextEditingController downPercent = TextEditingController(text: '0');

  /// 13 c
  final TextEditingController executingAgency = TextEditingController();
  final TextEditingController watchingAgency = TextEditingController();

  ///date
  final TextEditingController startDate = TextEditingController();
  final TextEditingController finishDate = TextEditingController();
  final TextEditingController contractDate = TextEditingController();

  void setStartDate(String date) {
    startDate.text = date;
  }

  void setFinishingDate(String date) {
    finishDate.text = date;
  }

  void setContractDate(String date) {
    contractDate.text = date;
  }

  void setBranch(String branchName) {
    branch.text = branchName;
  }

  void setexecutingAgency(String executingAgencyName) {
    executingAgency.text = executingAgencyName;
  }

  void setwatchingAgency(String watchingAgencyName) {
    watchingAgency.text = watchingAgencyName;
  }

  void setAddressName(String addressNameText) {
    addressName.text = addressNameText;
  }

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
    addressName.clear();

    upPercent.text = '0';
    downPercent.text = '0';

    watchingAgency.clear();
    executionPeriod.clear();
    startDate.clear();
    startDate.clear();
    contractDate.clear();
  }
}
