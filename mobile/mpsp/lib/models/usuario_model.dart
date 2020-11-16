import 'dart:convert';

import 'dart:io';

class UsuarioModel {
  int idUsuario;
  String nome;
  String email;
  String senha;
  String cidade;

  UsuarioModel({
    this.idUsuario,
    this.nome,
    this.email,
    this.senha,
    this.cidade,
  });

  static UsuarioModel usuarioModel;

  factory UsuarioModel.fromJson(String str) =>
      UsuarioModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromMap(Map<String, dynamic> json) => UsuarioModel(
        idUsuario: (json["idUsuario"] is int)
            ? json["idUsuario"]
            : int.parse(json["idUsuario"]),
        nome: json["nome"],
        email: json["email"],
        senha: json["senha"],
        cidade: json["cidade"],
      );
  Map<String, dynamic> toMap() => {
        "nome": nome,
        "email": email,
        "senha": senha,
        "cidade": cidade,
      };
}
