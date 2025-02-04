class HomeModel {
  Banner? banner;
  DefaultQuote? defaultQuote;
  List<Posts>? posts;
  List<Courses>? courses;
  List<EBooks>? ebooks;

  HomeModel(
      {this.banner, this.defaultQuote, this.posts, this.courses, this.ebooks});

  HomeModel.fromJson(Map<String, dynamic> json) {
    banner = json['banner'] != null ? Banner.fromJson(json['banner']) : null;
    defaultQuote = json['default_quote'] != null
        ? DefaultQuote.fromJson(json['default_quote'])
        : null;

    if (json['posts'] != null) {
      if (json['posts'] is List) {
        posts = <Posts>[];
        json['posts'].forEach((v) {
          posts!.add(Posts.fromJson(v));
        });
      } else {
        // Handle case where 'posts' is not a list
        print("'posts' is not in the expected format");
      }
    }

    if (json['courses'] != null) {
      if (json['courses'] is List) {
        courses = <Courses>[];
        json['courses'].forEach((v) {
          courses!.add(Courses.fromJson(v));
        });
      } else {
        // Handle case where 'courses' is not a list
        print("'courses' is not in the expected format");
      }
    }

    if (json['ebooks'] != null) {
      if (json['ebooks'] is List) {
        ebooks = <EBooks>[];
        json['ebooks'].forEach((v) {
          ebooks!.add(EBooks.fromJson(v));
        });
      } else {
        // Handle case where 'ebooks' is not a list
        print("'ebooks' is not in the expected format");
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banner != null) {
      data['banner'] = banner!.toJson();
    }
    if (defaultQuote != null) {
      data['default_quote'] = defaultQuote!.toJson();
    }
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    if (ebooks != null) {
      data['ebooks'] = ebooks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banner {
  int? id;
  String? title;
  String? image;
  String? productId;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? categoryId;

  Banner(
      {this.id,
      this.title,
      this.image,
      this.productId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.categoryId});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    productId = json['product_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['product_id'] = productId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['category_id'] = categoryId;
    return data;
  }
}

class DefaultQuote {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? quote;
  String? status;
  int? categoryId;

  DefaultQuote(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.quote,
      this.status,
      this.categoryId});

  DefaultQuote.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    quote = json['quote'];
    status = json['status'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['quote'] = quote;
    data['status'] = status;
    data['category_id'] = categoryId;
    return data;
  }
}

class Posts {
  int? id;
  String? source;
  int? type;
  String? createdAt;
  String? updatedAt;
  int? status;

  Posts(
      {this.id,
      this.source,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.status});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['source'] = source;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
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

    data['position'] = position;
    data['filename'] = filename;
    return data;
  }
}

class EBooks {
  int? id;
  String? title;
  String? thumbanail;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? position;
  String? filename;

  EBooks(
      {this.id,
      this.title,
      this.thumbanail,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.position,
      this.filename});

  EBooks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbanail = json['thumbanail'];
    description = json['description'];
    status = json['status'];
    position = json['position'];
    filename = json['filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['thumbanail'] = thumbanail;
    data['description'] = description;
    data['status'] = status;
    data['position'] = position;
    data['filename'] = filename;
    return data;
  }
}
