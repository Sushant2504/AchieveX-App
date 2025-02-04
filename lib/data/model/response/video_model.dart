class Videos {
  int? id;
  String? VideosLink;
  int? status;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  Videos(
      {this.id,
      this.VideosLink,
      this.status,
      this.categoryId,
      this.createdAt,
      this.updatedAt});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    VideosLink = json['Videos_link'];
    status = json['status'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Videos_link'] = VideosLink;
    data['status'] = status;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
