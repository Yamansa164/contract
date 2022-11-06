import 'material_response.dart';

class ContractResponse {
  ContractResponse({
    required this.id,
    required this.name,
    required this.date,
    required this.branch,
    required this.content,
    required this.upPercent,
    required this.downPercent,
    required this.number,
    required this.price,
    required this.upPrice,
    required this.startingDate,
    required this.finishingDate,
    required this.executionPeriod,
    required this.executingAgency,
    required this.watchingAgency,
    required this.materials,
  });
  late final int id;
  late final String name;
  late final String date;
  late final String branch;
  late final String content;
  late final int upPercent;
  late final int downPercent;
  late final String number;
  late final int price;
  late final int upPrice;
  late final String startingDate;
  late final String finishingDate;
  late final String executionPeriod;
  late final String executingAgency;
  late final String watchingAgency;
  late final List<MaterialsResponse> materials;
  
  ContractResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    date = json['date'];
    branch = json['branch'];
    content = json['content'];
    upPercent = json['up_percent'];
    downPercent = json['down_percent'];
    number = json['number'];
    price = json['price'];
    upPrice = json['up_price'];
    startingDate = json['starting_date'];
    finishingDate = json['finishing_date'];
    executionPeriod = json['execution_period'];
    executingAgency = json['executing_agency'];
    watchingAgency = json['watching_agency'];
    materials = List.from(json['materials']).map((e)=>MaterialsResponse.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['date'] = date;
    _data['branch'] = branch;
    _data['content'] = content;
    _data['up_percent'] = upPercent;
    _data['down_percent'] = downPercent;
    _data['number'] = number;
    _data['price'] = price;
    _data['up_price'] = upPrice;
    _data['starting_date'] = startingDate;
    _data['finishing_date'] = finishingDate;
    _data['execution_period'] = executionPeriod;
    _data['executing_agency'] = executingAgency;
    _data['watching_agency'] = watchingAgency;
    _data['materials'] = materials.map((e)=>e.toJson()).toList();
    return _data;
  }
}
