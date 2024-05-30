import 'package:flutter/material.dart';
import 'package:piproy/scr/widgets/tres_botones_header.dart';

PreferredSize headerApp(BuildContext context, String titulo, Widget otroWidget,
    double alto, bool conrojo, String pagina) {
  double width = MediaQuery.of(context).size.width;
  double altoHeader = 160;
  if (width <= 320) {
    altoHeader = 150;
  }

  return PreferredSize(
    preferredSize: Size.fromHeight(altoHeader + alto),
    child: Container(
      //width: double.infinity,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          tresBotonesHeader(context, conrojo, pagina),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Text(titulo,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: titulo == 'A Y U D A'
                        ? Colors.black87
                        : Theme.of(context).primaryColor,
                    fontSize: 25)),
          ),
          alto > 0
              ? Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    otroWidget,
                  ],
                )
              : SizedBox(),
        ],
      ),
    ),
  );
}
