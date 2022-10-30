import 'package:contracts/featuers/add_contract/data/repositories_impl/repositories_impl.dart';
import 'package:contracts/featuers/add_contract/domain/repostitories/repositories.dart';
import 'package:contracts/featuers/add_contract/domain/usecase/add_contract_usecase.dart';
import 'package:get_it/get_it.dart';


import 'featuers/add_contract/data/datasource/remote_data_source.dart';

final GetIt instance = GetIt.instance;
Future<void> init() async {
  /// usecase
  ///
  
  instance.registerFactory<AddContractUseCase>(
      () => AddContractUseCase(repositories: instance<Repositories>()));

  // repository
  
  instance.registerFactory<Repositories>(() => RepositoriesImpl(
       remoteDataSource: instance<RemoteDataSource>()));

  //core
  
  // instance.registerFactory<NetworkInfo>(
  //     () => NetworkInfoImpl(dataConnectionChecker: instance<DataConnectionChecker>()));

  //datasource
  
  instance
      .registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  // external

  // final sharedPreferences = await SharedPreferences.getInstance();
  //   instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  
  // instance.registerFactory<InternetConnectionCheckerPlus>(
  //     () => InternetConnectionCheckerPlus());
}
