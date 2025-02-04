class AppDataModel {
  int? id;
  String? referReward;
  String? installLimit;
  String? aboutUs;
  String? contactUs;
  String? privacyPolicy;
  String? createdAt;
  String? updatedAt;
  String? termsCondition;

  AppDataModel(
      {this.id,
      this.referReward,
      this.installLimit,
      this.aboutUs,
      this.contactUs,
      this.privacyPolicy,
      this.termsCondition,
      this.createdAt,
      this.updatedAt});

  AppDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referReward = json['refer_reward'];
    installLimit = json['install_limit'];
    aboutUs = json['about_us'];
    contactUs = json['contact_us'];
    privacyPolicy = json['privacy_policy'];
    termsCondition = json['terms_conditions'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['refer_reward'] = referReward;
    data['install_limit'] = installLimit;
    data['about_us'] = aboutUs;
    data['contact_us'] = contactUs;
    data['terms_conditions'] = termsCondition;
    data['privacy_policy'] = privacyPolicy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}