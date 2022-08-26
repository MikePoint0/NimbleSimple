class PlayerListResponseModel {
  String? status;
  String? message;
  List<PlayerListResponseModelData>? playerListResponseModelData;

  PlayerListResponseModel({this.status, this.message, this.playerListResponseModelData});

  PlayerListResponseModel.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      playerListResponseModelData = <PlayerListResponseModelData>[];
      json['data'].forEach((v) {
        playerListResponseModelData!.add(new PlayerListResponseModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.playerListResponseModelData != null) {
      data['data'] = this.playerListResponseModelData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlayerListResponseModelData {
  String? id;
  String? firstName;
  String? lastName;
  String? dob;
  int? age;
  String? gender;
  String? jerseyNo;
  String? userId;
  String? clubId;
  String? weight;
  String? height;
  String? photo;
  String? position;
  String? createdAt;
  String? updatedAt;

  PlayerListResponseModelData(
      {this.id,
        this.firstName,
        this.lastName,
        this.dob,
        this.age,
        this.gender,
        this.jerseyNo,
        this.userId,
        this.clubId,
        this.weight,
        this.height,
        this.photo,
        this.position,
        this.createdAt,
        this.updatedAt});

  PlayerListResponseModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dob = json['dob'];
    age = json['age'];
    gender = json['gender'];
    jerseyNo = json['jersey_no'];
    userId = json['user_id'];
    clubId = json['club_id'];
    weight = json['weight'];
    height = json['height'];
    photo = json['photo'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['dob'] = this.dob;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['jersey_no'] = this.jerseyNo;
    data['user_id'] = this.userId;
    data['club_id'] = this.clubId;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['photo'] = this.photo;
    data['position'] = this.position;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
