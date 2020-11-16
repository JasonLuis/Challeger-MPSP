import 'package:flutter/material.dart';
import 'package:mpsp/models/usuario_model.dart';
import 'package:mpsp/service/usuario_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  UsuarioModel usuario = new UsuarioModel();
  UsuarioModel model = new UsuarioModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(
          top: 80,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 228,
                height: 128,
                child: Image.asset("assets/images/logo.png"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Digite um e-mail valido';
                  }
                  return null;
                },
                onSaved: (value) {
                  usuario.email = value;
                },
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Digite a senha';
                  }
                  return null;
                },
                onSaved: (value) {
                  usuario.senha = value;
                },
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 40,
                alignment: Alignment.centerLeft,
                child: FlatButton(
                  onPressed: () => {},
                  child: Text(
                    "Recuperar Senha",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 60,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 69, 0, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    onPressed: () async {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        model = await UsuarioService().loginUser(usuario);
                        if (model == null) {
                          scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text("Login ou senha incorreta"),
                            ),
                          );
                        } else {
                          UsuarioModel.usuarioModel = model;

                          Navigator.pushNamed(
                            context,
                            '/homePage',
                            arguments: UsuarioModel.usuarioModel,
                          );
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color(0xFF3C5A99),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    onPressed: () => {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: SizedBox(
                            child: Image.asset("assets/images/fb-icon.png"),
                            height: 28,
                            width: 28,
                          ),
                        ),
                        Text(
                          "Login com Facebook",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                child: FlatButton(
                  onPressed: () async {
                    var retorno =
                        await Navigator.pushNamed(context, '/create_login');

                    if (retorno != null) {
                      setState(() {});
                      scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Text(retorno),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Cadastre-se",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
