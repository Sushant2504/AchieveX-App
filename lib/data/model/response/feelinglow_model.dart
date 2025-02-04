class FeelinglowModel {
  List<ComedyVideo>? comedyVideo;
  List<MotivationVideo>? motivationVideo;
   String? audioFile;

  FeelinglowModel({this.comedyVideo, this.motivationVideo,this.audioFile});

  FeelinglowModel.fromJson(Map<String, dynamic> json) {
    if (json['comedy_video'] != null) {
      comedyVideo = <ComedyVideo>[];
      json['comedy_video'].forEach((v) {
        comedyVideo!.add(ComedyVideo.fromJson(v));
      });
    }
    if (json['motivation_video'] != null) {
      motivationVideo = <MotivationVideo>[];
      json['motivation_video'].forEach((v) {
        motivationVideo!.add(MotivationVideo.fromJson(v));
      });
    }

   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (comedyVideo != null) {
      data['comedy_video'] = comedyVideo!.map((v) => v.toJson()).toList();
    }
    if (motivationVideo != null) {
      data['motivation_video'] =
          motivationVideo!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class ComedyVideo {
  int? id;
  String? videoLink;
  int? status;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  int? type;

  ComedyVideo(
      {this.id,
      this.videoLink,
      this.status,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.type});

  ComedyVideo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoLink = json['video_link'];
    status = json['status'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['video_link'] = videoLink;
    data['status'] = status;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['type'] = type;
    return data;
  }
}

class MotivationVideo {
  int? id;
  String? videoLink;
  int? status;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  int? type;

  MotivationVideo(
      {this.id,
      this.videoLink,
      this.status,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.type});

  MotivationVideo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoLink = json['video_link'];
    status = json['status'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id; 
    data['video_link'] = videoLink;
    data['status'] = status;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['type'] = type;
    return data;
  }
}