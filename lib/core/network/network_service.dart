import 'dart:convert';

import 'package:nimble_simple/core/datasource/key.dart';
import 'package:nimble_simple/core/datasource/local_storage.dart';
import 'package:nimble_simple/core/enums/request_type.dart';
import 'package:nimble_simple/core/enums/server_type.dart';
import 'package:nimble_simple/core/models/response/UserResultModel.dart';
import 'package:nimble_simple/core/navigation/keys.dart';
import 'package:nimble_simple/core/navigation/navigation_service.dart';
import 'package:nimble_simple/core/startup/app_startup.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:nimble_simple/core/utils/constants.dart';

import 'network_info.dart';

class NetworkService {
  final ServerType serverType;
  final Client _httpClient = Client();
  // final bool noAuth;
  Map<String, String> header = {};
  bool? _isLogedin = false;

  NetworkService(
    this.serverType,
  );

  Future<Response?> call({
    required String url,
    required RequestType requestType,
    Map? payload,
    bool? isMultipart,
  }) async {

    String? authToken = '';
    _isLogedin = (await GetIt.I.get<LocalStorage>().readBool(LocalStorageKeys.kLoginPrefs))!;
    if (_isLogedin!) {
      if (serviceLocator.isRegistered<UserResultData>()) {
        authToken = await GetIt.I.get<LocalStorage>().readString(LocalStorageKeys.kTokenPrefs);
      }
    }

      header = {
        'Authorization': "Bearer "+authToken!,
        'Content-Type': 'application/json',
        'RequestSource': 'Web',
        'accept': '/',
      };

    late Response response;
    try {
      Uri uri = Uri.parse(url);

      bool hasInternetConnection = await serviceLocator.get<NetworkInfo>().isConnected;
      if (!hasInternetConnection) {
        Fluttertoast.showToast(msg: "No internet connection");
        return null;
      }
      if (requestType == RequestType.get) {
        response = await _getRequest(uri);
      } else if (requestType == RequestType.post) {
        response = await _postRequest(uri, payload);
      } else if (requestType == RequestType.put) {
        response = await _putRequest(uri, payload);
      } else if (requestType == RequestType.patch) {
        response = await _putRequest(uri, payload);
      }

      if (response.statusCode == 401 && GetIt.I.isRegistered<User>()) {
        GetIt.I.get<NavigationService>().clearAllTo(RouteKeys.routeLoginScreen);
      }

      debugPrint(response.body);
      debugPrint(url);
      debugPrint(jsonEncode(payload));
      debugPrint('RESHELP statusCode: ' + response.statusCode.toString());
      debugPrint('RESHELP body: ' + response.body);

      //return jsonDecode(response.body);
      return response;
      // if (response.isSuccessful) return jsonDecode(response.body);
      // return null;
    } catch (ex) {
      debugPrint(ex.toString());
      return null;
    }
  }

  Future<Response> _getRequest(Uri url) async {
    return await _httpClient.get(url);//, headers: header
  }

  Future<Response> _postRequest(Uri uri, Map? payload) async {
    return await _httpClient.post(uri, headers: header, body: jsonEncode(payload));
  }

  Future<Response> _putRequest(Uri uri, Map? payload) async {
    return await _httpClient.put(uri, headers: header, body: jsonEncode(payload));
  }

}

extension ResponseExt on Response {
  bool get isSuccessful => statusCode == 200 || statusCode == 201;
}
