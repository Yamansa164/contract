// import 'package:contracts/featuers/add_contract/data/response/contract_material_response.dart';

// class ContractResponse {
//   ContractResponse({
//     required this.name,
//     required this.executingAgency,
//     required this.watchingAgency,
//     required this.date,
//     required this.startingDate,
//     required this.finishingDate,
//     required this.executionPeriod,
//     required this.upPercent,
//     required this.downPercent,
//     required this.number,
//     required this.branch,
//     required this.content,
//     required this.price,
//     required this.upPrice,
//     required this.materials,
//   });
//   late final String name;
//   late final String executingAgency;
//   late final String watchingAgency;
//   late final String date;
//   late final String startingDate;
//   late final String finishingDate;
//   late final String executionPeriod;
//   late final int upPercent;
//   late final int downPercent;
//   late final String number;
//   late final String branch;
//   late final String content;
//   late final int price;
//   late final int upPrice;
//   late final List<ContractMaterialsResponse> materials;
  
//   ContractResponse.fromJson(Map<String, dynamic> json){
//     name = json['name'];
//     executingAgency = json['executing_agency'];
//     watchingAgency = json['watching_agency'];
//     date = json['date'];
//     startingDate = json['starting_date'];
//     finishingDate = json['finishing_date'];
//     executionPeriod = json['execution_period'];
//     upPercent = json['up_percent'];
//     downPercent = json['down_percent'];
//     number = json['number'];
//     branch = json['branch'];
//     content = json['content'];
//     price = json['price'];
//     upPrice = json['up_price'];
//     materials = List.from(json['materials']).map((e)=>ContractMaterialsResponse.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['name'] = name;
//     data['executing_agency'] = executingAgency;
//     data['watching_agency'] = watchingAgency;
//     data['date'] = date;
//     data['starting_date'] = startingDate;
//     data['finishing_date'] = finishingDate;
//     data['execution_period'] = executionPeriod;
//     data['up_percent'] = upPercent;
//     data['down_percent'] = downPercent;
//     data['number'] = number;
//     data['branch'] = branch;
//     data['content'] = content;
//     data['price'] = price;
//     data['up_price'] = upPrice;
//     data['materials'] = materials.map((e)=>e.toJson()).toList();
//     return data;
//   }
// }
