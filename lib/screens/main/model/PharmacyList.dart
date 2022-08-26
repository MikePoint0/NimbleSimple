class PharmacyList {
  List<Pharmacies>? pharmacies;

  PharmacyList({this.pharmacies});

  PharmacyList.fromJson(Map<dynamic, dynamic> json) {
    if (json['pharmacies'] != null) {
      pharmacies = <Pharmacies>[];
      json['pharmacies'].forEach((v) {
        pharmacies!.add(new Pharmacies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pharmacies != null) {
      data['pharmacies'] = this.pharmacies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pharmacies {
  String? name;
  String? pharmacyId;

  Pharmacies({this.name, this.pharmacyId});

  Pharmacies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    pharmacyId = json['pharmacyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['pharmacyId'] = this.pharmacyId;
    return data;
  }
}
