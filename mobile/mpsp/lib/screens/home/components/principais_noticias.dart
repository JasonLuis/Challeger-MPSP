import 'package:flutter/material.dart';
import 'package:mpsp/models/news_model.dart';
import 'package:mpsp/store/news_screen_store.dart';

import '../../../constantes.dart';

class PrincipaisNoticias extends StatelessWidget {
  const PrincipaisNoticias({
    Key key,
    @required this.news,
    this.newsStore,
  }) : super(key: key);

  final List<NewsModel> news;
  final NewsScreenStore newsStore;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<Widget>.generate(
          news.length,
          (int index) {
            return PrincipaisNoticiasCard(
              news: news[index],
              press: () {},
            );
          },
        ),
      ),
    );
  }
}

class PrincipaisNoticiasCard extends StatelessWidget {
  const PrincipaisNoticiasCard({
    Key key,
    this.news,
    this.press,
  }) : super(key: key);

  final NewsModel news;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: cPadding,
        top: cPadding / 2,
        bottom: cPadding * 2.5,
      ),
      width: 340,
      child: Column(
        children: <Widget>[
          Image.network(
            news.image,
          ),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(cPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: cPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${news.titulo}\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
