class TimetableModel {
  int? id;
  String? content;
  dynamic categoryId;
  String? status;
  String? createdAt;
  String? updatedAt;

  TimetableModel(
      {this.id,
      this.content,
      this.categoryId,
      this.status,
      this.createdAt,
      this.updatedAt});

  TimetableModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    categoryId = json['category_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['category_id'] = categoryId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
