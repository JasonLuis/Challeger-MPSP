import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kommunicate_flutter_plugin/kommunicate_flutter_plugin.dart';

import 'package:mpsp/store/news_screen_store.dart';

import 'components/corpo.dart';
import 'components/rodape.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  NewsScreenStore newsScreenStore = new NewsScreenStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: buildAppBar(context),
      body: Corpo(
        newsScreenStore: newsScreenStore,
      ),
      bottomNavigationBar: Rodape(
        newsScreenStore: newsScreenStore,
      ),
    );
  }
}

//Barra do app
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/log-out.svg"),
      onPressed: () {
        KommunicateFlutterPlugin.logout();
        Navigator.pop(context);
      },
    ),
  );
}
