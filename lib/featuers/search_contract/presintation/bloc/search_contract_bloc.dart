import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_contract_event.dart';
part 'search_contract_state.dart';

class SearchContractBloc extends Bloc<SearchContractEvent, SearchContractState> {
  SearchContractBloc() : super(SearchContractInitial()) {
    on<SearchContractEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
