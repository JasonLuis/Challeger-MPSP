import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constantes.dart';

class NewsListViewLoading extends StatelessWidget {
  const NewsListViewLoading({
    Key key,
  }) : super(key: key);

  static const _duration = Duration(milliseconds: 4000);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //print(cursos.name);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<Widget>.generate(
          3,
          (int index) {
            return CardLoading(size: size, duration: _duration);
          },
        ),
      ),
    );
  }
}

class CardLoading extends StatelessWidget {
  const CardLoading({
    Key key,
    @required this.size,
    @required Duration duration,
  })  : _duration = duration,
        super(key: key);

  final Size size;
  final Duration _duration;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          left: cPadding,
          top: cPadding / 2,
          bottom: cPadding * 0.5,
        ),
        width: size.width * 0.4,
        child: Column(
          children: <Widget>[
            Container(
              child: Shimmer.fromColors(
                highlightColor: cPrimaryColor,
                baseColor: cTextoCor,
                period: _duration,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: Icon(Icons.autorenew),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(cPadding / 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: cPrimaryColor,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Shimmer.fromColors(
                        highlightColor: Colors.white,
                        baseColor: cPrimaryColor,
                        period: _duration,
                        child: Container(
                          height: 10,
                          width: MediaQuery.of(context).size.width * 0.3,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
