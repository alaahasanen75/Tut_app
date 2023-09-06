class ItemModel {
  int? id;
  String? title;
  String? img;

  ItemModel(this.id, this.img, this.title);
  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['image'];
    title = json['title'];
  }
}

class Data {
  List<ItemModel>? services;
  List<ItemModel>? banners;
  List<ItemModel>? stores;
  Data(this.banners, this.services, this.stores);
  Data.fromJson(Map<String, dynamic> json) {
    services = json['services'];
    banners = json['banners'];
    stores = json['stores'];
  }
}

class Model {
  int? status;
  String? message;
  Data? data;
  Model(
    this.message,
    this.status,
  );
  Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }
}
