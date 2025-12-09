class BaseModel<T> {
  String? status;
  String? message;
  T? data;

  BaseModel({this.status, this.message, this.data});
  
  // Factory method untuk parsing dari JSON
  factory BaseModel.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return BaseModel<T>(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
 

  // Konversi kembali ke Map
  Map<String, dynamic> toJson(Object Function(T? value) toJsonT) {
    return {
      'status': status,
      'message': message,
      'data': data != null ? toJsonT(data) : null,
    };
  }
}
