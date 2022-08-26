class CreateTeamResponseModel {
  String? status;
  String? message;
  CreateTeamResponseModelData? createTeamResponseModelData;

  CreateTeamResponseModel({this.status, this.message, this.createTeamResponseModelData});

  CreateTeamResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    createTeamResponseModelData = json['data'] != null ? new CreateTeamResponseModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.createTeamResponseModelData != null) {
      data['data'] = this.createTeamResponseModelData!.toJson();
    }
    return data;
  }
}

class CreateTeamResponseModelData {
  String? id;
  String? teamName;
  String? categoryId;
  Null? location;
  Null? country;
  String? clubId;
  String? createdAt;
  String? updatedAt;

  CreateTeamResponseModelData(
      {this.id,
        this.teamName,
        this.categoryId,
        this.location,
        this.country,
        this.clubId,
        this.createdAt,
        this.updatedAt});

  CreateTeamResponseModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamName = json['team_name'];
    categoryId = json['category_id'];
    location = json['location'];
    country = json['country'];
    clubId = json['club_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['team_name'] = this.teamName;
    data['category_id'] = this.categoryId;
    data['location'] = this.location;
    data['country'] = this.country;
    data['club_id'] = this.clubId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}