class AnalysedVideosSingletonModel {
  String? status;
  String? message;
  Data? data;

  AnalysedVideosSingletonModel({this.status, this.message, this.data});

  AnalysedVideosSingletonModel.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  int? analysed;
  String? choice;
  String? gpuId;
  String? lastMediaUrl;
  String? about;
  String? userId;
  String? clubId;
  String? statusText;
  String? code;
  String? text;
  String? filename;
  int? firstView;
  int? fps;
  int? videoLength;
  String? videoUploadType;
  String? fullVideo;
  String? createdAt;
  String? updatedAt;
  List<ClubStats>? clubStats;
  String? minimap;
  List<Actions>? actions;
  List<ActionsUrls>? actionsUrls;

  Data(
      {this.id,
        this.analysed,
        this.choice,
        this.gpuId,
        this.lastMediaUrl,
        this.about,
        this.userId,
        this.clubId,
        this.statusText,
        this.code,
        this.text,
        this.filename,
        this.firstView,
        this.fps,
        this.videoLength,
        this.videoUploadType,
        this.fullVideo,
        this.createdAt,
        this.updatedAt,
        this.clubStats,
        this.minimap,
        this.actions,
        this.actionsUrls});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    analysed = json['analysed'];
    choice = json['choice'];
    gpuId = json['gpu_id'];
    lastMediaUrl = json['last_media_url'];
    about = json['about'];
    userId = json['user_id'];
    clubId = json['club_id'];
    statusText = json['status_text'];
    code = json['code'];
    text = json['text'];
    filename = json['filename'];
    firstView = json['first_view'];
    fps = json['fps'];
    videoLength = json['video_length'];
    videoUploadType = json['video_upload_type'];
    fullVideo = json['full_video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['club_stats'] != null) {
      clubStats = <ClubStats>[];
      json['club_stats'].forEach((v) {
        clubStats!.add(new ClubStats.fromJson(v));
      });
    }
    minimap = json['minimap'];
    if (json['actions'] != null) {
      actions = <Actions>[];
      json['actions'].forEach((v) {
        actions!.add(new Actions.fromJson(v));
      });
    }
    if (json['actions_urls'] != null) {
      actionsUrls = <ActionsUrls>[];
      json['actions_urls'].forEach((v) {
        actionsUrls!.add(new ActionsUrls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['analysed'] = this.analysed;
    data['choice'] = this.choice;
    data['gpu_id'] = this.gpuId;
    data['last_media_url'] = this.lastMediaUrl;
    data['about'] = this.about;
    data['user_id'] = this.userId;
    data['club_id'] = this.clubId;
    data['status_text'] = this.statusText;
    data['code'] = this.code;
    data['text'] = this.text;
    data['filename'] = this.filename;
    data['first_view'] = this.firstView;
    data['fps'] = this.fps;
    data['video_length'] = this.videoLength;
    data['video_upload_type'] = this.videoUploadType;
    data['full_video'] = this.fullVideo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.clubStats != null) {
      data['club_stats'] = this.clubStats!.map((v) => v.toJson()).toList();
    }
    data['minimap'] = this.minimap;
    if (this.actions != null) {
      data['actions'] = this.actions!.map((v) => v.toJson()).toList();
    }
    if (this.actionsUrls != null) {
      data['actions_urls'] = this.actionsUrls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClubStats {
  String? id;
  String? analyticsId;
  String? pitchSide;
  int? shortPass;
  int? foul;
  int? shots;
  int? penalty;
  int? ballPossession;
  int? freeKick;
  int? dribble;
  String? offside;
  int? corners;
  int? longPass;
  int? freeThrow;
  int? longShot;
  int? cross;
  String? interceptions;
  String? isHome;
  String? tempTeamName;
  int? tackles;
  int? yellowCards;
  int? redCards;
  int? saves;
  int? goals;
  String? sampleImage;
  String? clubId;
  String? createdAt;
  String? updatedAt;

  ClubStats(
      {this.id,
        this.analyticsId,
        this.pitchSide,
        this.shortPass,
        this.foul,
        this.shots,
        this.penalty,
        this.ballPossession,
        this.freeKick,
        this.dribble,
        this.offside,
        this.corners,
        this.longPass,
        this.freeThrow,
        this.longShot,
        this.cross,
        this.interceptions,
        this.isHome,
        this.tempTeamName,
        this.tackles,
        this.yellowCards,
        this.redCards,
        this.saves,
        this.goals,
        this.sampleImage,
        this.clubId,
        this.createdAt,
        this.updatedAt});

  ClubStats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    analyticsId = json['analytics_id'];
    pitchSide = json['pitch_side'] ?? "0";
    shortPass = json['short_pass'] ?? 0;
    foul = json['foul'] ?? 0;
    shots = json['shots'] ?? 0;
    penalty = json['penalty'] ?? 0;
    ballPossession = json['ball_possession'] ?? 0;
    freeKick = json['free_kick'] ?? 0;
    dribble = json['dribble'] ?? 0;
    offside = json['offside'] ?? "0";
    corners = json['corners'] ?? 0;
    longPass = json['long_pass'] ?? 0;
    freeThrow = json['free_throw'] ?? 0;
    longShot = json['long_shot'] ?? 0;
    cross = json['cross'] ?? 0;
    interceptions = json['interceptions'] ?? "0";
    isHome = json['is_home'];
    tempTeamName = json['temp_team_name'];
    tackles = json['tackles'] ?? 0;
    yellowCards = json['yellow_cards'] ?? 0;
    redCards = json['red_cards'] ?? 0;
    saves = json['saves'] ?? 0;
    goals = json['goals'] ?? 0;
    sampleImage = json['sample_image'];
    clubId = json['club_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['analytics_id'] = this.analyticsId;
    data['pitch_side'] = this.pitchSide;
    data['short_pass'] = this.shortPass;
    data['foul'] = this.foul;
    data['shots'] = this.shots;
    data['penalty'] = this.penalty;
    data['ball_possession'] = this.ballPossession;
    data['free_kick'] = this.freeKick;
    data['dribble'] = this.dribble;
    data['offside'] = this.offside;
    data['corners'] = this.corners;
    data['long_pass'] = this.longPass;
    data['free_throw'] = this.freeThrow;
    data['long_shot'] = this.longShot;
    data['cross'] = this.cross;
    data['interceptions'] = this.interceptions;
    data['is_home'] = this.isHome;
    data['temp_team_name'] = this.tempTeamName;
    data['tackles'] = this.tackles;
    data['yellow_cards'] = this.yellowCards;
    data['red_cards'] = this.redCards;
    data['saves'] = this.saves;
    data['goals'] = this.goals;
    data['sample_image'] = this.sampleImage;
    data['club_id'] = this.clubId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Actions {
  String? id;
  int? start;
  int? end;
  String? playerName;
  String? playerPosition;
  String? playerTeam;
  String? actionId;
  String? analyticsId;
  String? createdAt;
  String? updatedAt;
  Action? action;

  Actions(
      {this.id,
        this.start,
        this.end,
        this.playerName,
        this.playerPosition,
        this.playerTeam,
        this.actionId,
        this.analyticsId,
        this.createdAt,
        this.updatedAt,
        this.action});

  Actions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    start = json['start'];
    end = json['end'];
    playerName = json['player_name'];
    playerPosition = json['player_position'];
    playerTeam = json['player_team'];
    actionId = json['action_id'];
    analyticsId = json['analytics_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    action =
    json['action'] != null ? new Action.fromJson(json['action']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start'] = this.start;
    data['end'] = this.end;
    data['player_name'] = this.playerName;
    data['player_position'] = this.playerPosition;
    data['player_team'] = this.playerTeam;
    data['action_id'] = this.actionId;
    data['analytics_id'] = this.analyticsId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.action != null) {
      data['action'] = this.action!.toJson();
    }
    return data;
  }
}

class Action {
  String? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Action({this.id, this.name, this.createdAt, this.updatedAt});

  Action.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ActionsUrls {
  String? videoUrl;
  String? actionId;
  Action? action;
  String? name;

  ActionsUrls({this.videoUrl, this.actionId, this.action, this.name});

  ActionsUrls.fromJson(Map<String, dynamic> json) {
    videoUrl = json['video_url'];
    actionId = json['action_id'];
    action =
    json['action'] != null ? new Action.fromJson(json['action']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_url'] = this.videoUrl;
    data['action_id'] = this.actionId;
    if (this.action != null) {
      data['action'] = this.action!.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}