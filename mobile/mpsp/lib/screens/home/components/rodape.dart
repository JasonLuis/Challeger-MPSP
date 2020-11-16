import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kommunicate_flutter_plugin/kommunicate_flutter_plugin.dart';
import 'package:mpsp/models/usuario_model.dart';

import 'package:mpsp/screens/editar/update_screen.dart';
import 'package:mpsp/store/news_screen_store.dart';

import '../../../constantes.dart';

class Rodape extends StatelessWidget {
  const Rodape({
    Key key,
    this.newsScreenStore,
  }) : super(key: key);

  final NewsScreenStore newsScreenStore;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: cPadding * 2,
        right: cPadding * 2,
        bottom: cPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: cPrimaryColor.withOpacity(0.38),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/home-run.svg"),
            onPressed: () {
              Navigator.pushNamed(context, '/homePage',
                  arguments: UsuarioModel.usuarioModel);
            },
          ),
          new IconButton(
            icon: SvgPicture.asset("assets/icons/message.svg"),
            onPressed: () {
              dynamic user = {
                'userId': UsuarioModel.usuarioModel
                    .email, //Replace it with the userId of the logged in user
                'password': UsuarioModel.usuarioModel
                    .senha //Put password here if user has password, ignore otherwise
              };
              dynamic conversationObject = {
                'appId':
                    '2479e2d14207a9b8bd3de861cdf32a5bf', // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from Kommunicate dashboard.
                'kmUser': jsonEncode(user),
              };

              KommunicateFlutterPlugin.buildConversation(conversationObject)
                  .then((clientConversationId) {
                print("Conversation builder success : " +
                    clientConversationId.toString());
              }).catchError((error) {
                print("Conversation builder error : " + error.toString());
              });
            },
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/user-icon.svg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpadateLogin(
                    newsScreenStore: newsScreenStore,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
