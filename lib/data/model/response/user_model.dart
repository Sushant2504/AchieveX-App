class UserModel {
  Data? data;
  bool? first_time;

  UserModel({this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    first_time = json['first_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
        data['first_time'] = first_time;
    }
    
    return data;
  }
}

class Data {
  String? fName;
  String? phone;
  String? referCode;
  String? referBy;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? email;

  Data(
      {this.fName,
      this.phone,
      this.referCode,
      this.referBy,
      this.updatedAt,
      this.createdAt,
      this.email,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    fName = json['f_name'];
    phone = json['phone'];
    email = json['email'];
    referCode = json['refer_code'];
    referBy = json['refer_by'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['f_name'] = fName;
    data['phone'] = phone;
    data['email'] = email;
    data['refer_code'] = referCode;
    data['refer_by'] = referBy;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}