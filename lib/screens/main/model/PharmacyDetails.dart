class PharmacyDetails {
  String? responseCode;
  String? href;
  String? details;
  String? generatedTs;
  Value? value;

  PharmacyDetails(
      {this.responseCode,
        this.href,
        this.details,
        this.generatedTs,
        this.value});

  PharmacyDetails.fromJson(Map<dynamic, dynamic> json) {
    responseCode = json['responseCode'];
    href = json['href'];
    details = json['details'];
    generatedTs = json['generatedTs'];
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['href'] = this.href;
    data['details'] = this.details;
    data['generatedTs'] = this.generatedTs;
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    return data;
  }
}

class Value {
  String? id;
  String? pharmacyChainId;
  String? name;
  bool? active;
  String? localId;
  bool? testPharmacy;
  Address? address;
  String? primaryPhoneNumber;
  String? defaultTimeZone;
  String? pharmacistInCharge;
  String? postalCodes;
  List<String>? deliverableStates;
  String? pharmacyHours;
  String? deliverySubsidyAmount;
  String? pharmacySystem;
  bool? acceptInvalidAddress;
  String? pharmacyType;
  String? pharmacyLoginCode;
  bool? checkoutPharmacy;
  bool? marketplacePharmacy;
  bool? importActive;

  Value(
      {this.id,
        this.pharmacyChainId,
        this.name,
        this.active,
        this.localId,
        this.testPharmacy,
        this.address,
        this.primaryPhoneNumber,
        this.defaultTimeZone,
        this.pharmacistInCharge,
        this.postalCodes,
        this.deliverableStates,
        this.pharmacyHours,
        this.deliverySubsidyAmount,
        this.pharmacySystem,
        this.acceptInvalidAddress,
        this.pharmacyType,
        this.pharmacyLoginCode,
        this.checkoutPharmacy,
        this.marketplacePharmacy,
        this.importActive});

  Value.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pharmacyChainId = json['pharmacyChainId'];
    name = json['name'];
    active = json['active'];
    localId = json['localId'];
    testPharmacy = json['testPharmacy'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    primaryPhoneNumber = json['primaryPhoneNumber'];
    defaultTimeZone = json['defaultTimeZone'];
    pharmacistInCharge = json['pharmacistInCharge'];
    postalCodes = json['postalCodes'];
    deliverableStates = json['deliverableStates'].cast<String>();
    pharmacyHours = json['pharmacyHours'];
    deliverySubsidyAmount = json['deliverySubsidyAmount'];
    pharmacySystem = json['pharmacySystem'];
    acceptInvalidAddress = json['acceptInvalidAddress'];
    pharmacyType = json['pharmacyType'];
    pharmacyLoginCode = json['pharmacyLoginCode'];
    checkoutPharmacy = json['checkoutPharmacy'];
    marketplacePharmacy = json['marketplacePharmacy'];
    importActive = json['importActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pharmacyChainId'] = this.pharmacyChainId;
    data['name'] = this.name;
    data['active'] = this.active;
    data['localId'] = this.localId;
    data['testPharmacy'] = this.testPharmacy;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['primaryPhoneNumber'] = this.primaryPhoneNumber;
    data['defaultTimeZone'] = this.defaultTimeZone;
    data['pharmacistInCharge'] = this.pharmacistInCharge;
    data['postalCodes'] = this.postalCodes;
    data['deliverableStates'] = this.deliverableStates;
    data['pharmacyHours'] = this.pharmacyHours;
    data['deliverySubsidyAmount'] = this.deliverySubsidyAmount;
    data['pharmacySystem'] = this.pharmacySystem;
    data['acceptInvalidAddress'] = this.acceptInvalidAddress;
    data['pharmacyType'] = this.pharmacyType;
    data['pharmacyLoginCode'] = this.pharmacyLoginCode;
    data['checkoutPharmacy'] = this.checkoutPharmacy;
    data['marketplacePharmacy'] = this.marketplacePharmacy;
    data['importActive'] = this.importActive;
    return data;
  }
}

class Address {
  String? streetAddress1;
  String? city;
  String? usTerritory;
  String? postalCode;
  double? latitude;
  double? longitude;
  String? addressType;
  String? externalId;
  bool? isValid;
  String? googlePlaceId;

  Address(
      {this.streetAddress1,
        this.city,
        this.usTerritory,
        this.postalCode,
        this.latitude,
        this.longitude,
        this.addressType,
        this.externalId,
        this.isValid,
        this.googlePlaceId});

  Address.fromJson(Map<String, dynamic> json) {
    streetAddress1 = json['streetAddress1'];
    city = json['city'];
    usTerritory = json['usTerritory'];
    postalCode = json['postalCode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    addressType = json['addressType'];
    externalId = json['externalId'];
    isValid = json['isValid'];
    googlePlaceId = json['googlePlaceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['streetAddress1'] = this.streetAddress1;
    data['city'] = this.city;
    data['usTerritory'] = this.usTerritory;
    data['postalCode'] = this.postalCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['addressType'] = this.addressType;
    data['externalId'] = this.externalId;
    data['isValid'] = this.isValid;
    data['googlePlaceId'] = this.googlePlaceId;
    return data;
  }
}