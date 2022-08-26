import 'package:get_it/get_it.dart';
import 'package:nimble_simple/core/datasource/local_data_cubit.dart';
import 'package:nimble_simple/core/enums/server_type.dart';
import 'package:nimble_simple/core/network/network_service.dart';

import '../../screens/main/cubit/main_cubit.dart';
import '../../screens/main/service/service.dart';

void registerCubit(GetIt serviceLocator) {

  serviceLocator.registerSingleton(
    MainCubit(
      MainService(
        newServerService: NetworkService(ServerType.newServer),
      ),
    ),
  );

serviceLocator.registerSingleton(
  LocalDataCubit(),
  );
}
