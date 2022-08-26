import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:nimble_simple/core/utils/images.dart';

import '../../../core/startup/app_startup.dart';
import '../../../core/utils/constants.dart';
import '../model/PharmacyDetails.dart';
import '../model/PharmacyList.dart';
import '../service/service.dart';
part 'main_state.dart';


class MainCubit extends Cubit<MainState> {
  final MainService _mainService;

  MainCubit(this._mainService) : super(PharmacyListInitial());

  getPharmacyList(BuildContext context) async {

    emit(PharmacyListLoading());
    try {
      if (serviceLocator.isRegistered<PharmacyList>()) {
        serviceLocator.unregister<PharmacyList>();
      }
      String data = await DefaultAssetBundle.of(context).loadString(AppAssets.pharmacyList);
      Map json = await jsonDecode(data);
      PharmacyList pharmacyList = await PharmacyList.fromJson(json);
      serviceLocator.registerSingleton<PharmacyList>(pharmacyList);
      emit(PharmacyListSuccess());
    } catch (ex) {
      print(ex.toString()+"-----");
      emit(PharmacyListError(AppConstants.exceptionMessage));
    }
  }

  getPharmacyDetails(String pharmaID) async {
    emit(PharmacyDetailsLoading());

    try {
      Response? response = await _mainService.getPharmacyDetails(pharmaID);
      if (response == null) {
        emit(PharmacyDetailsError(AppConstants.serverConnectionMessage));
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        resolvePharmacyDetails(jsonDecode(response.body));
      } else {
        Map? body = jsonDecode(response.body);
        emit(PharmacyDetailsError(body!['message']));
      }
    } catch (ex) {
      print(ex.toString()+"-----");
      emit(PharmacyDetailsError(AppConstants.exceptionMessage));
    }
  }

  void resolvePharmacyDetails(Map? body) {
    if (body == null) {
      throw Exception('null response');
    } else {
      // String responseStatus = body['status'];
      // String message = body['message'];

      //if (responseStatus.toLowerCase() == "ok") {
        if (GetIt.I.isRegistered<PharmacyDetails>()) {
          GetIt.I.unregister<PharmacyDetails>();
        }
        PharmacyDetails pharmacyDetails = PharmacyDetails.fromJson(body);
        GetIt.I.registerSingleton<PharmacyDetails>(pharmacyDetails);
        emit(PharmacyDetailsSuccess());
      // } else {
      //   emit(LoginUserError(message));
      // }
    }
  }

  getDrugList() async {

    emit(DrugListLoading());
    try {
      Response? response = await _mainService.getDrugList();
      if (response == null) {
        emit(DrugListError(AppConstants.serverConnectionMessage));
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        return resolveDrugList(response.body);
      } else {
        Map? body = jsonDecode(response.body);
        emit(DrugListError(body!['message']));
      }
    } catch (ex) {
      print(ex.toString()+"-----");
      emit(DrugListError(AppConstants.exceptionMessage));
    }
  }

  Future<List<List<dynamic>>> resolveDrugList(String? body) async {
    if (body == null) {
      throw Exception('null response');
    } else {
      // String responseStatus = body['status'];
      // String message = body['message'];

      //if (responseStatus.toLowerCase() == "ok") {
      //process csv and store as list
      List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter(eol: "\n",fieldDelimiter: ",").convert(body);
      print(rowsAsListOfValues[0].toString());
      emit(PharmacyDetailsSuccess());
      return rowsAsListOfValues;
      // } else {
      //   emit(LoginUserError(message));
      // }
    }
  }


}