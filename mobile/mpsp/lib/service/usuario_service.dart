import 'package:dio/dio.dart';
import 'package:mpsp/models/usuario_model.dart';
import 'package:mpsp/service/service_config.dart';

class UsuarioService {
  static final String _endpoint = "http://192.168.0.111:8080/fiap/usuario";
  static final String _url = "http://192.168.0.111:8080/fiap/usuario/login";
  static final String _resource = '';

  final ServiceConfig service = new ServiceConfig(_endpoint);
  final ServiceConfig login = new ServiceConfig(_url);

  Future<void> create(UsuarioModel usuarioModel) async {
    try {
      usuarioModel.idUsuario = 0;
      Response response = await service.create().post(
            _resource,
            data: usuarioModel.toMap(),
          );

      if (response.statusCode == 201) {
        var retorno = (response.data["id"] is String)
            ? int.parse(response.data["id"])
            : response.data["id"];
        return retorno;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<int> update(UsuarioModel usuarioModel) async {
    try {
      String endpoint = _endpoint + "/" + usuarioModel.idUsuario.toString();

      Response response = await service.create().put(
            endpoint,
            data: usuarioModel.toMap(),
          );

      var retorno = (response.data["idUsuario"] is String)
          ? int.parse(response.data["idUsuario"])
          : response.data["idUsuario"];
      return retorno;
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<UsuarioModel> loginUser(UsuarioModel model) async {
    try {
      //model.nome = "";
      Response response = await login.create().post(
            _resource,
            data: model.toMap(),
          );
      if (response.statusCode == 200) {
        var retorno = UsuarioModel.fromMap(response.data);
        return retorno;
      } else {
        return null;
      }
    } catch (error) {
      print("Service Error: $error ");
      return null;
    }
  }
}
