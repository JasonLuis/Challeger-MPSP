import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mpsp/models/usuario_model.dart';
import 'package:mpsp/screens/home/components/info_novidades.dart';
import 'package:mpsp/screens/home/components/loading.dart';
import 'package:mpsp/screens/home/components/principais_noticias.dart';
import 'package:mpsp/screens/home/components/titulo_btn_mais.dart';
import 'package:mpsp/store/news_screen_store.dart';

import 'cabecalho_e_pesquisa.dart';

class Corpo extends StatelessWidget {
  const Corpo({
    Key key,
    this.newsScreenStore,
  }) : super(key: key);

  final NewsScreenStore newsScreenStore;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CabecalhoPesquisa(
            size: size,
            newsScreenStore: newsScreenStore,
          ),
          TituloBtnMais(
            titulo: "Principais Noticias",
            press: () {},
          ),
          Observer(
            builder: (ctx) {
              if (newsScreenStore.isLoading) {
                return NewsListViewLoading();
              } else {
                return PrincipaisNoticias(
                  news: newsScreenStore.filtered,
                  newsStore: newsScreenStore,
                );
              }
            },
          ),
          TituloBtnMais(
            titulo: "Novidades",
            press: () {},
          ),
          InfoNovidades(),
        ],
      ),
    );
  }
}
