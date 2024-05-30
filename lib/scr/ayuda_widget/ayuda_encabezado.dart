import 'package:flutter/material.dart';

List<Widget> ayudaEncabezado(BuildContext context, String titulo) {
  List<Widget> listaAyudaEncabezado = [
    SizedBox(
      height: 10,
    ),
    Container(
      child: Center(
          child: Text(titulo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30, color: Theme.of(context).primaryColor))),
    ),
    SizedBox(
      height: 10,
    ),
    SizedBox(
      height: 10,
    ),
    Divider(
      height: 10,
      color: Theme.of(context).primaryColor,
    ),
    SizedBox(
      height: 10,
    ),
  ];
  return listaAyudaEncabezado;
}
