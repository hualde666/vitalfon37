import 'package:flutter/material.dart';

Widget inicioBoton(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  // double height = MediaQuery.of(context).size.height;
  double ancho = 100;
  double alto = 50;
  if (width <= 320) {
    ancho = 80;
    alto = 40;
  }
  return Container(
      width: ancho,
      height: alto,
      decoration: BoxDecoration(
          color: Colors.black38,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 1,
              spreadRadius: 0.5,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          border:
              Border.all(color: Theme.of(context).primaryColor, width: 0.5)),
      margin: EdgeInsets.only(right: 5),
      child: Center(
        child: Text(
          'INICIO',
          style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
        ),
      ));
}
