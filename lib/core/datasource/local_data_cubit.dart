
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nimble_simple/core/models/response/UserResultModel.dart';
import 'package:nimble_simple/core/utils/constants.dart';

import 'key.dart';
import 'local_storage.dart';


part 'local_data_state.dart';


class LocalDataCubit extends Cubit<LocalDataState> {

  LocalDataCubit() : super(GetLocallyStoredUserDataInitial());

  getLocallyStoredUserData() async {

    emit(GetLocallyStoredUserDataLoading());

    // try {
    //
    //   UserResultData? userResultData = await GetIt.I.get<LocalStorage>().readSecureObject(LocalStorageKeys.kUserPrefs);
    //   if (userResultData == null) {
    //     emit(GetLocallyStoredUserDataError(AppConstants.localDBErrorMessage));
    //   } else {
    //     resolveGetLocallyStoredUserData(userResultData);
    //   }
    // } catch (ex) {
    //   emit(GetLocallyStoredUserDataError(AppConstants.localDBErrorMessage));
    // }
  }

  void resolveGetLocallyStoredUserData(UserResultData userResultData) {
        if (GetIt.I.isRegistered<UserResultData>()) {
          GetIt.I.unregister<UserResultData>();
        }
        GetIt.I.registerSingleton<UserResultData>(userResultData);
        emit(GetLocallyStoredUserDataSuccess("message"));
      }
  }