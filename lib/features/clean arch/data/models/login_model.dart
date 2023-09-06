import 'package:flutter/cupertino.dart';

class SuccessfullLoginModel {
  String? status;
  String? message;
  ContentLoginModel? content;
  CastumarLoginModel? castumer;
  SuccessfullLoginModel(
      {this.castumer, this.content, this.message, this.status});
  factory SuccessfullLoginModel.fromJson(Map<String, dynamic> json) =>
      SuccessfullLoginModel(
          status: json['status'],
          message: json['message'],
          castumer: CastumarLoginModel.fromJson(json['customer']),
          content: ContentLoginModel.fromJson(json['contacts']));

  get statusCode => null;
}

class CastumarLoginModel {
  String? id;
  String? name;
  CastumarLoginModel({this.id, this.name});

  factory CastumarLoginModel.fromJson(Map<String, dynamic> json) =>
      CastumarLoginModel(
        id: json['id'],
        name: json['name'],
      );
}

class ContentLoginModel {
  String? phone;
  String? email;
  String? link;
  ContentLoginModel({
    this.email,
    this.link,
    this.phone,
  });
  factory ContentLoginModel.fromJson(Map<String, dynamic> json) =>
      ContentLoginModel(
          email: json['email'], phone: json['phone'], link: json['link']);
}
