import 'package:http/http.dart';

import '../../../core/enums/request_type.dart';
import '../../../core/network/keys.dart';
import '../../../core/network/network_service.dart';

class MainService {
  final NetworkService newServerService;

  MainService({
    required this.newServerService,
  });

  Future<Response?> getPharmacyDetails(String pharmaID) async {
    return await newServerService(
        requestType: RequestType.get,
        url: ApiConstants.pharmaDetails + pharmaID,
    );
  }

Future<Response?> getDrugList() async {
    return await newServerService(
        requestType: RequestType.get,
        url: ApiConstants.drugList,
    );
  }

}
