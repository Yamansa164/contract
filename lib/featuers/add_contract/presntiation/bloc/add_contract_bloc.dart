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
        areaName: areaName.text,
        executingAgency: executingAgency.text,
        watchingAgency: watchingAgency.text,
        date: contractDate.text,
        startingDate: startDate.text,
        executionPeriod: executionPeriod.text,
        upPercent: int.parse(upPercent.text),
        downPercent: int.parse(downPercent.text),
        number: contractNum.text,
        stoppingsPercent: int.parse(stopping.text),
        branch: branch.text,
        projectName: projectName.text,
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

  final TextEditingController areaName = TextEditingController();// اسم الموقع
  final TextEditingController branch = TextEditingController();//اسم الفرع
  final TextEditingController projectName = TextEditingController();  //اسم المشروع
  final TextEditingController contractNum = TextEditingController();// رقم لعقد
  final TextEditingController executionPeriod = TextEditingController();//  مدة التنفيذ
  final TextEditingController stopping = TextEditingController();// نسبة التوقيفات
  final TextEditingController upPercent = TextEditingController(text: '0');// نسبة التنزيل
  final TextEditingController downPercent = TextEditingController(text: '0');// نسبة الضم
  final TextEditingController executingAgency = TextEditingController();// الجهة المنفذة 
  final TextEditingController watchingAgency = TextEditingController();// الجهة المشرفة

  ///date
  final TextEditingController startDate = TextEditingController();// تاريخ المباشرة 
  final TextEditingController contractDate = TextEditingController();// تاريخ العقد

  void setBranch(String branchName) {
    branch.text = branchName;
  }

  void setexecutingAgency(String executingAgencyName) {
    executingAgency.text = executingAgencyName;
  }

  void setwatchingAgency(String watchingAgencyName) {
    watchingAgency.text = watchingAgencyName;
  }

  void setAreaName(String areaNameText) {
    areaName.text = areaNameText;
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
    areaName.clear();
    branch.clear();
    contractNum.clear();
    executingAgency.clear();
    projectName.clear();

    upPercent.text = '0';
    downPercent.text = '0';

    watchingAgency.clear();
    executionPeriod.clear();
    startDate.clear();
    startDate.clear();
    contractDate.clear();
  }
}
