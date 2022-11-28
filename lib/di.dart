import 'package:contracts/featuers/add_contract/data/repositories_impl/repositories_impl.dart';
import 'package:contracts/featuers/add_contract/domain/repostitories/repositories.dart';
import 'package:contracts/featuers/add_contract/domain/usecase/add_contract_usecase.dart';
import 'package:contracts/featuers/search_contract/domain/usecase/add_statements.dart';
import 'package:contracts/featuers/search_contract/domain/usecase/get_statements.dart';
import 'package:contracts/featuers/search_contract/domain/usecase/search_contract.dart';
import 'package:get_it/get_it.dart';

import 'featuers/add_contract/data/datasource/remote_data_source.dart';
import 'featuers/search_contract/data/datasource/remote_datasource.dart';
import 'featuers/search_contract/data/repositories_impl/repositories_impl.dart';
import 'featuers/search_contract/domain/repostitories/repositories.dart';

final GetIt instance = GetIt.instance;
Future<void> init() async {
  /// usecase
  ///

  instance.registerFactory<AddContractUseCase>(() =>
      AddContractUseCase(repositories: instance<AddContractRepositories>()));
  instance.registerFactory<SearchContractUseCase>(() => SearchContractUseCase(
      repositories: instance<ContractRepositories>()));
      instance.registerFactory<AddStatementsUseCase>(() => AddStatementsUseCase(
      repositories: instance<ContractRepositories>()));
      instance.registerFactory<GetStatementsUseCase>(() => GetStatementsUseCase(
      repositories: instance<ContractRepositories>()));

  // repository

  instance.registerFactory<AddContractRepositories>(() =>
      AddContractRepositoriesImpl(
          remoteDataSource: instance<AddContractRemoteDataSource>()));

  instance.registerFactory<ContractRepositories>(() =>
      ContractRepositoriesImpl(
          contractRemoteDatesource:
              instance<ContractRemoteDatasource>()));

  //core

  // instance.registerFactory<NetworkInfo>(
  //     () => NetworkInfoImpl(dataConnectionChecker: instance<DataConnectionChecker>()));

  //datasource

  instance.registerLazySingleton<AddContractRemoteDataSource>(
      () => AddContractRemoteDataSourceImpl());

  instance.registerLazySingleton<ContractRemoteDatasource>(
      () => ContractRemoteDataSourceImpl());

  // external

  // final sharedPreferences = await SharedPreferences.getInstance();
  //   instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // instance.registerFactory<InternetConnectionCheckerPlus>(
  //     () => InternetConnectionCheckerPlus());
}
