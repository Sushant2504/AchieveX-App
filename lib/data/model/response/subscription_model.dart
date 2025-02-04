class SubscriptionModel {
	List<Subscription>? subscription;

	SubscriptionModel({this.subscription});

	SubscriptionModel.fromJson(Map<String, dynamic> json) {
		if (json['subscription'] != null) {
			subscription = <Subscription>[];
			json['subscription'].forEach((v) { subscription!.add(Subscription.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		if (subscription != null) {
      data['subscription'] = subscription!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Subscription {
	int? id;
	int? userId;
	int? duration;
	int? amount;
	String? createdAt;
	String? updatedAt;
	String? purchaseDate;
	String? expireDate;
	String? couponCode;

	Subscription({this.id, this.userId, this.duration, this.amount, this.createdAt, this.updatedAt, this.purchaseDate, this.expireDate, this.couponCode});

	Subscription.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		userId = json['user_id'];
		duration = json['duration'];
		amount = json['amount'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		purchaseDate = json['purchase_date'];
		expireDate = json['expire_date'];
		couponCode = json['coupon_code'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['id'] = id;
		data['user_id'] = userId;
		data['duration'] = duration;
		data['amount'] = amount;
		data['created_at'] = createdAt;
		data['updated_at'] = updatedAt;
		data['purchase_date'] = purchaseDate;
		data['expire_date'] = expireDate;
		data['coupon_code'] = couponCode;
		return data;
	}
}