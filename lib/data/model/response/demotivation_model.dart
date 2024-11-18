class DemotivationModel {
  final ComedyVideo comedyVideo;
  final MotivationVideo motivationVideo;
  final String audioFile;

  DemotivationModel({
    required this.comedyVideo,
    required this.motivationVideo,
    required this.audioFile,
  });

  factory DemotivationModel.fromJson(Map<String, dynamic> json) {
    return DemotivationModel(
      comedyVideo: ComedyVideo.fromJson(json['comedy_video']),
      motivationVideo: MotivationVideo.fromJson(json['motivation_video']),
      audioFile: json['audio_file'],
    );
  }
}

class ComedyVideo {
  final int? id;
  final String? videoLink;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final int? categoryId;
  final int? type;

  ComedyVideo({
    required this.id,
    required this.videoLink,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryId,
    required this.type,
  });

  factory ComedyVideo.fromJson(Map<String, dynamic> json) {
    return ComedyVideo(
      id: json['id'],
      videoLink: json['video_link'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      categoryId: json['category_id'],
      type: json['type'],
    );
  }
}

class MotivationVideo {
  final int? id;
  final String? videoLink;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final int? categoryId;
  final int? type;

  MotivationVideo({
    required this.id,
    required this.videoLink,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryId,
    required this.type,
  });

  factory MotivationVideo.fromJson(Map<String, dynamic> json) {
    return MotivationVideo(
      id: json['id'],
      videoLink: json['video_link'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      categoryId: json['category_id'],
      type: json['type'],
    );
  }
}