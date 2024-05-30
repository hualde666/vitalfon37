import 'package:flutter/material.dart';

class AyudaParrafo extends StatelessWidget {
  AyudaParrafo({
    required this.texto,
    this.fontweigth = FontWeight.normal,
    this.fontsize = 25,
  });

  final String texto;
  final FontWeight fontweigth;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      margin: EdgeInsets.only(left: 20, right: 20, top: 3),
      child: Text(texto,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: fontweigth,
              fontSize: fontsize,
              color: Colors.black54) //.of(context).primaryColor),
          ),
    );
  }
}
