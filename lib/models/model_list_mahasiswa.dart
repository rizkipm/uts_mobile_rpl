// To parse this JSON data, do
//
//     final modelListMahasiswa = modelListMahasiswaFromJson(jsonString);

import 'dart:convert';

ModelListMahasiswa modelListMahasiswaFromJson(String str) => ModelListMahasiswa.fromJson(json.decode(str));

String modelListMahasiswaToJson(ModelListMahasiswa data) => json.encode(data.toJson());

class ModelListMahasiswa {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelListMahasiswa({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelListMahasiswa.fromJson(Map<String, dynamic> json) => ModelListMahasiswa(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String idUser;
  String username;
  String nama;
  String nobp;
  String nohp;
  String email;
  String alamat;
  String password;
  DateTime created;
  dynamic updated;

  Datum({
    required this.idUser,
    required this.username,
    required this.nama,
    required this.nobp,
    required this.nohp,
    required this.email,
    required this.alamat,
    required this.password,
    required this.created,
    required this.updated,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idUser: json["id_user"],
    username: json["username"],
    nama: json["nama"],
    nobp: json["nobp"],
    nohp: json["nohp"],
    email: json["email"],
    alamat: json["alamat"],
    password: json["password"],
    created: DateTime.parse(json["created"]),
    updated: json["updated"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser,
    "username": username,
    "nama": nama,
    "nobp": nobp,
    "nohp": nohp,
    "email": email,
    "alamat": alamat,
    "password": password,
    "created": created.toIso8601String(),
    "updated": updated,
  };
}
