import 'package:contracts/featuers/home/presintation/page/home_screen.dart';
import 'package:contracts/featuers/search_contract/presntiation/bloc/contract_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../featuers/add_contract/presntiation/bloc/add_contract_bloc.dart';
import '../../featuers/add_contract/presntiation/page/add_contract_page.dart';
import '../../featuers/search_contract/presntiation/page/contract_page.dart';

class Routes {
  static const String contractMaterial = '/contractMaterial';
  static const String homeScreen = '/homescreen';
  static const String searchContract = '/searchcontract';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.contractMaterial:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AddContractBloc(),
            child: const AddContractPage(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.searchContract:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ContractBloc(),
            child: const ContractPage(),
          ),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Not Found'),
              ),
              body: const Center(child: Text('Not Found')),
            ));
  }
}
