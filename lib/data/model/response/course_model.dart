class course_model {
  List<Courses>? courses;

  course_model({this.courses});

  course_model.fromJson(Map<String, dynamic> json) {
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  int? id;
  String? title;
  String? thumbanail;
  String? description;
  String? videoUrl;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? position;
  String? filename;

  Courses(
      {this.id,
      this.title,
      this.thumbanail,
      this.description,
      this.videoUrl,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.position,
      this.filename});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbanail = json['thumbanail'];
    description = json['description'];
    videoUrl = json['video_url'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    position = json['position'];
    filename = json['filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['thumbanail'] = thumbanail;
    data['description'] = description;
    data['video_url'] = videoUrl;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['position'] = position;
    data['filename'] = filename;
    return data;
  }
}
