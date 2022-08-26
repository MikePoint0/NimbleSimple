class PurchaseList {
  String? pharmacyName;
  String? pharmacyId;
  List<List>? drugs;

  PurchaseList({this.pharmacyName, this.pharmacyId, this.drugs});

  PurchaseList.fromJson(Map<String, dynamic> json) {
    pharmacyName = json['pharmacy_name'];
    pharmacyId = json['pharmacy_id'];
    if (json['drugs'] != null) {
      drugs = json['drugs'];
      //json['drugs'].forEach((v) { drugs!.add(new Drugs.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pharmacy_name'] = this.pharmacyName;
    data['pharmacy_id'] = this.pharmacyId;
    if (this.drugs != null) {
      //data['drugs'] = this.drugs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

