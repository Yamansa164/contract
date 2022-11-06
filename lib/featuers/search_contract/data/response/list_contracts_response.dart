import 'contract_response.dart';

class ListContractsResponse {
  ListContractsResponse({
    required this.data,
  });
  late final List<ContractResponse> data;
  
  ListContractsResponse.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((contract)=>ContractResponse.fromJson(contract)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}