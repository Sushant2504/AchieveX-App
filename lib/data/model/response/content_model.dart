class ContentModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? timeTable;
  String? tipsTricks;
  String? feelingLow;
  String? facingDemotiovation;
  String? MindMaps;
  String? defaultQuote;

  ContentModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.timeTable,
      this.tipsTricks,
      this.feelingLow,
      this.facingDemotiovation,
      this.MindMaps,
      this.defaultQuote});

  ContentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    timeTable = json['time_table'];
    tipsTricks = json['tips_tricks'];
    feelingLow = json['feeling_low'];
    facingDemotiovation = json['facing_demotiovation'];
    MindMaps = json['mind_maps'];
    defaultQuote = json['default_quote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['time_table'] = timeTable;
    data['tips_tricks'] = tipsTricks;
    data['feeling_low'] = feelingLow;
    data['facing_demotiovation'] = facingDemotiovation;
    data['mind_maps'] = MindMaps;
    data['default_quote'] = defaultQuote;
    return data;
  }
}