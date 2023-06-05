import 'package:flutter_quizzes/pojo/work.dart';

class OrderResponse {
  int? id;
  int? userId;
  int? deliveryId;
  int? workId;
  String? details;
  String? detailsAddress;
  String? lat;
  String? long;
  String? phone;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<PhotoOrder>? photoOrder;
  Work? work;

  OrderResponse({
    this.id,
    this.userId,
    this.deliveryId,
    this.workId,
    this.details,
    this.detailsAddress,
    this.lat,
    this.long,
    this.phone,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.photoOrder,
    this.work,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      id: json['id'],
      userId: json['user_id'],
      deliveryId: json['delivery_id'],
      workId: json['work_id'],
      details: json['details'],
      detailsAddress: json['details_address'],
      lat: json['lat'],
      long: json['long'],
      phone: json['phone'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      photoOrder: List<PhotoOrder>.from(
        json['photo_order'].map((x) => PhotoOrder.fromJson(x)),
      ),
      work: Work.fromJson(json['work']),
    );
  }

  Map<String, dynamic> toJsonOrder() {
    final Map<String, dynamic> data = {
      'details': details ?? '',
      'details_address': detailsAddress ?? '',
      'phone': phone ?? '',
      'work_id': workId.toString(), // Convert int to string
    };

    if (id != null) {
      data['id'] = id;
    }

    // Convert the list of PhotoOrder objects to a List<Map<String, dynamic>>
    if (photoOrder != null) {
      data['photo_order'] = photoOrder!.map((photo) => photo.toJson()).toList();
    }

    return data;
  }
}

class PhotoOrder {
  int? id;
  String? photo;
  int? orderId;
  String? createdAt;
  String? updatedAt;

  PhotoOrder({
    this.id,
    this.photo,
    this.orderId,
    this.createdAt,
    this.updatedAt,
  });

  factory PhotoOrder.fromJson(Map<String, dynamic> json) {
    return PhotoOrder(
      id: json['id'],
      photo: json['photo'],
      orderId: json['order_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'photo': photo,
      'order_id': orderId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
