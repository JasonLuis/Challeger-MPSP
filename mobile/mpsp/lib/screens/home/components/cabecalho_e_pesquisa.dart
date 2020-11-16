import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mpsp/constantes.dart';
import 'package:mpsp/models/usuario_model.dart';
import 'package:mpsp/store/news_screen_store.dart';

class CabecalhoPesquisa extends StatefulWidget {
  CabecalhoPesquisa({
    Key key,
    @required this.size,
    @required this.newsScreenStore,
  }) : super(key: key);

  final Size size;

  final NewsScreenStore newsScreenStore;
  @override
  _CabecalhoPesquisaState createState() => _CabecalhoPesquisaState();
}

class _CabecalhoPesquisaState extends State<CabecalhoPesquisa> {
  @override
  Widget build(BuildContext context) {
    widget.newsScreenStore.alterarValor();
    return Container(
      margin: EdgeInsets.only(bottom: cPadding * 2.5),
      height: widget.size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: cPadding,
              right: cPadding,
              bottom: 36 + cPadding,
            ),
            height: widget.size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: cPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Observer(
                  builder: (param) => Text(
                    'Bem vindo ' + widget.newsScreenStore.user.nome,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Spacer(),
                Observer(
                  builder: (param) => CircleAvatar(
                    child: Text(
                      widget.newsScreenStore.user.nome.toUpperCase()[0],
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: cPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    backgroundColor: Colors.white,
                    maxRadius: 24,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: cPadding),
                padding: EdgeInsets.symmetric(horizontal: cPadding),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: cPrimaryColor.withOpacity(0.23),
                    )
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: cPrimaryColor.withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: widget.newsScreenStore.setFiltro,
                      ),
                    ),
                    SvgPicture.asset("assets/icons/search.svg"),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
