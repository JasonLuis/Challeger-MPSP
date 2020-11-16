import 'package:flutter/material.dart';

import '../../../constantes.dart';

class TituloBtnMais extends StatelessWidget {
  const TituloBtnMais({Key key, this.titulo, this.press}) : super(key: key);
  final String titulo;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: cPadding),
      child: Row(
        children: [
          TituloSublinhado(
            texto: titulo,
          ),
          Spacer(),
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: cPrimaryColor,
            onPressed: press,
            child: Text(
              "Mais",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class TituloSublinhado extends StatelessWidget {
  const TituloSublinhado({
    Key key,
    this.texto,
  }) : super(key: key);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: cPadding / 4),
            child: Text(
              texto,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: cTextoCor),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: cPadding / 4),
              height: 7,
              color: cPrimaryColor.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
