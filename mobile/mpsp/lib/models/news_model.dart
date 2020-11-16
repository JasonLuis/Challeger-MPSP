import 'dart:convert';

class NewsModel {
  int id;
  String createdAt;
  String titulo;
  String descricao;
  String image;

  NewsModel({
    this.id,
    this.createdAt,
    this.titulo,
    this.descricao,
    this.image,
  });

  factory NewsModel.fromJson(String str) => NewsModel.fromMap(json.decode(str));

  factory NewsModel.fromMap(Map<String, dynamic> json) => NewsModel(
        id: (json["id"] is int) ? json["id"] : int.parse(json["id"]),
        createdAt: json["createdAt"],
        titulo: json["titulo"],
        descricao: json["descricao"],
        image: json["image"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt,
        "titulo": titulo,
        "descricao": descricao,
        "image": image,
      };
}
