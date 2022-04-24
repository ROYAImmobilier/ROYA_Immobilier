
import 'dart:convert';

List<Contacts> cityFromJson(String str) =>
    List<Contacts>.from(json.decode(str).map((x) => Contacts.fromJson(x)));

String cityToJson(List<Contacts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contacts {
  int? id;
  int? annonceId;
  String? type;
  String? fullName;
  String? email;
  String? phone;
  String? subject;
  String? message;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Contacts(
      {this.id,
        this.annonceId,
        this.type,
        this.fullName,
        this.email,
        this.phone,
        this.subject,
        this.message,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Contacts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    annonceId = json['annonce_id'];
    type = json['type'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    subject = json['subject'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['annonce_id'] = this.annonceId;
    data['type'] = this.type;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['subject'] = this.subject;
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}